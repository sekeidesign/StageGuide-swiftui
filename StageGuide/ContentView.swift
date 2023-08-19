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
        let fridayLineup = friday?.acts?.compactMap { $0 as? Act }
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(fridayLineup?.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date()}) ?? [], id: \.self.id) { act in
                        let actViewModel = ActViewModel(act: act) {
//                            act.isFavorite.toggle()
//                            print(act.isFavorite)
//                            persistenceController.save() // Save the context after toggling
                        }
                        SGActFeatured(viewModel: actViewModel)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(0)
            Button {
                persistenceController.deleteAllData()
            } label: {
                Text("Delete all data")
            }
            SGLineupSchedule()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
