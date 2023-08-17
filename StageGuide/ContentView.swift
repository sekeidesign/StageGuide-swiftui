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
    
    @State var isActive = true
    
    var body: some View {
        let timeZone: String = "America/Montreal"
        var friday: Day? {
                days.first(where: { $0.name == "Friday" })
            }
        let lineupDay = friday?.acts?.compactMap { $0 as? Act }
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(lineupDay ?? []) { act in
                        SGActFeatured(act: act, isFavorite: act.isFavorite)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(0)
            Button {
                // ——————————— ACTS ———————————
                let bundarr = Act(context: managedObjectContext)
                bundarr.id = UUID()
                bundarr.name = "Bundarr"
                bundarr.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 0, timeZone: timeZone)
                bundarr.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0, timeZone: timeZone)
                bundarr.imageName = "Artists/Bundarr"
                bundarr.bio = "DJ and Producer from Ottawa, Canada. Bundarr makes Tech House and Bass House as well as many different genres. You will get hooked by his infectious basslines and hard grooves!"
                bundarr.isFavorite = false
                //     ———
                let peekaboo = Act(context: managedObjectContext)
                peekaboo.id = UUID()
                peekaboo.name = "PEEKABOO"
                peekaboo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0, timeZone: timeZone)
                peekaboo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 0, timeZone: timeZone)
                peekaboo.imageName = "Artists/PEEKABOO"
                peekaboo.bio = "It’s easy to say that Matthew Lucas, a.k.a PEEKABOO, is the hottest act to break out in the electronic music scene in 2018. After a string of massively successful EP's, singles, and remixes, all within a few short months, audiences around the world have been captivated by PEEKABOO’s fresh, distinctive, and unique production style. His tracks, “Maniac”, and “Babatunde” have become iconic festival anthems, gaining support from the likes of Skrillex, Zeds Dead, Rezz, RL Grime, and the list goes on."
                peekaboo.isFavorite = false
                //     ———
                let dvk = Act(context: managedObjectContext)
                dvk.id = UUID()
                dvk.name = "Deorro B2B Valentino Khan"
                dvk.shortName = "VK B2B Deorro"
                dvk.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 0, timeZone: timeZone)
                dvk.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 0, timeZone: timeZone)
                dvk.imageName = "Artists/VKDeorro"
                dvk.bio = "A legendary back to back. Valentino Khan makes everything. The Los Angeles-based DJ and producer is an artist whose music knows no bounds. From producing hip-hop tracks for Grammy-winning artists to pumping out electronic anthems at top venues around the world, he's been breaking barriers with original tracks, production credentials and live sets. Los Angeles native Erick Orrosquieta, known as Deorro (and TON!C as well), is a house/EDM producer and DJ, as well as a proud Mexican American. After he developed a following through his SoundCloud page, he reached a wider audience in his early twenties, from 2012 through 2014, with extensive touring, as well as brash solo releases and collaborations on the Dim Mak and Mad Decent labels."
                dvk.isFavorite = false
                //    ———
                let sevenLions = Act(context: managedObjectContext)
                sevenLions.id = UUID()
                sevenLions.name = "Seven Lions"
                sevenLions.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 0, timeZone: timeZone)
                sevenLions.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 22, minute: 0, timeZone: timeZone)
                sevenLions.imageName = "Artists/Seven Lions"
                sevenLions.bio = "Melding mainstream pop, trance, and dubstep, California producer Jeff Montalvo quickly amassed a cult following under the alias Seven Lions, which issued the debut EP Days to Come in 2012. He made his Billboard 200 debut with third EP Worlds Apart in 2014. After follow-up EPs like 2015's The Throes of Winter and 2017's dance chart-topping Creation reflected a growing emphasis on song form, he landed just outside of the dance/electronic Top Ten with 2019's \"Need Your Love,\" a collaboration with Gryffin and singer/songwriter Noah Kahan. A decade into his recording career, he presented his first official album-length release, Beyond the Veil, in 2022."
                sevenLions.isFavorite = false
                
                
                // ——————————— STAGES ———————————
                let mainStage = Stage(context: managedObjectContext)
                mainStage.name = "Main"
                
                
                // ——————————— DAYS ———————————
                let friday = Day(context: managedObjectContext)
                friday.name = "Friday"
                friday.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 0, timeZone: timeZone)
                friday.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 23, minute: 0, timeZone: timeZone)
                
                
                
                // ——————————— FESTIVAL ———————————
                let riverside = Festival(context: managedObjectContext)
                riverside.name = "Riverside"
                riverside.bio = "Gatineau's only electronic music festival is back on September 8-9-10. This year is the 10th anniversary of the festival and it’s going to be completely CRAZY! You don’t want to miss it."
                riverside.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 0, timeZone: timeZone)
                riverside.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 23, minute: 0, timeZone: timeZone)
                riverside.isSaved = true
                riverside.imageName = "Riverside Image"
                riverside.logoName = "Riverside Logo"
                riverside.address = "100 Laurier St, Gatineau, Quebec"
                
                let daysSet = NSOrderedSet(set: [friday])
                let fridayActsSet = NSSet(set: [bundarr, peekaboo, dvk, sevenLions])
                let stagesSet = NSSet(set: [mainStage])
                
                
                mainStage.days = daysSet
                mainStage.acts = fridayActsSet
                
                friday.acts = fridayActsSet
                friday.stages = stagesSet
                friday.festival = riverside
                
                riverside.days = daysSet
                riverside.stages = stagesSet
                
                try? managedObjectContext.save()
            } label: {
                Text("Start")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
