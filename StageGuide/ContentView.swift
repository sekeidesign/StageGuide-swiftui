//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<Day>
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        var friday: Day? {
            days.first(where: { $0.name == "Friday" })
        }
        let fridayActs = friday?.acts?.compactMap { $0 as? Act }
        let fridayFeatured = fridayActs?.filter() { act in
            return act.isFeatured
        }
        NavigationStack {
            VStack {
                HStack {
                    Text("Featured artists")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        persistenceController.deleteAllData()
                    } label: {
                        Text("Reset data")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                ScrollView(.horizontal) {
                    HStack(spacing: 24) {
                        ForEach(fridayFeatured?.sorted(by: { $0.startTime ?? Date() > $1.startTime ?? Date()}) ?? [], id: \.self.id) { act in
                            let actViewModel = ActViewModel(act: act) {
                                //
                            }
                            SGActFeatured(viewModel: actViewModel)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .padding(0)
                HStack {
                    Text("Full schedule")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                SGLineupSchedule(day: friday)
            }
            .navigationTitle(Text("Riverside Festival"))
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
