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
    
    var body: some View {
        let sortedDays = days.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date() })
        let defaultDay = sortedDays.first(where: { $0.name == UserDefaults.standard.string(forKey: "ActiveDay")})
        EventScheduleView(days: days, activeDay: defaultDay ?? sortedDays[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
