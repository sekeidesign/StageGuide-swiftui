//
//  ActModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import SwiftUI

struct Act: Identifiable {
    let id = UUID()
    let name: String
    let shortName: String
    let startTime: Date
    let endTime: Date
    let stage: String
    let image: Image
    let description: String
    var isFavourite: Bool
}

// Helper function to create a Date instance
func dateFrom(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    let calendar = Calendar.current
    return calendar.date(from: components)!
}

// Create instances of Act and populate your data array
var friday: [Act] = [
    Act(name: "Dashi",
        shortName: "Dashi",
        startTime: dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 0),
        endTime: dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0),
        stage: "Main",
        image: Image("Artists/Dashi"),
        description: "It's About House Music And It Always Has Been",
        isFavourite: false
       ),
    Act(name: "Bundarr",
        shortName: "Bundarr",
        startTime: dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0),
        endTime: dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 0),
        stage: "Main",
        image: Image("Artists/Bundarr"),
        description: "DJ and Producer from Ottawa, Canada. Bundarr makes Tech House and Bass House as well as many different genres. You will get hooked by his infectious basslines and hard grooves!",
        isFavourite: false
       ),
    Act(name: "PEEKABOO",
        shortName: "PEEKABOO",
        startTime: dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 0),
        endTime: dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 0),
        stage: "Main",
        image: Image("Artists/Peekaboo"),
        description: "It’s easy to say that Matthew Lucas, a.k.a PEEKABOO, is the hottest act to break out in the electronic music scene in 2018. After a string of massively successful EP's, singles, and remixes, all within a few short months, audiences around the world have been captivated by PEEKABOO’s fresh, distinctive, and unique production style. His tracks, “Maniac”, and “Babatunde” have become iconic festival anthems, gaining support from the likes of Skrillex, Zeds Dead, Rezz, RL Grime, and the list goes on.",
        isFavourite: false
       ),
    Act(name: "Deorro B2B Valentino Khan",
        shortName: "VK & Deorro",
        startTime: dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 0),
        endTime: dateFrom(year: 2023, month: 9, day: 8, hour: 22, minute: 0),
        stage: "Main",
        image: Image("Artists/VK & Deorro"),
        description: "A legendary back to back. Valentino Khan makes everything. The Los Angeles-based DJ and producer is an artist whose music knows no bounds. From producing hip-hop tracks for Grammy-winning artists to pumping out electronic anthems at top venues around the world, he's been breaking barriers with original tracks, production credentials and live sets. Los Angeles native Erick Orrosquieta, known as Deorro (and TON!C as well), is a house/EDM producer and DJ, as well as a proud Mexican American. After he developed a following through his SoundCloud page, he reached a wider audience in his early twenties, from 2012 through 2014, with extensive touring, as well as brash solo releases and collaborations on the Dim Mak and Mad Decent labels.",
        isFavourite: false
       ),
    Act(name: "Seven Lions",
        shortName: "Seven Lions",
        startTime: dateFrom(year: 2023, month: 9, day: 8, hour: 22, minute: 0),
        endTime: dateFrom(year: 2023, month: 9, day: 8, hour: 23, minute: 0),
        stage: "Main",
        image: Image("Artists/Seven Lions"),
        description: "Melding mainstream pop, trance, and dubstep, California producer Jeff Montalvo quickly amassed a cult following under the alias Seven Lions, which issued the debut EP Days to Come in 2012. He made his Billboard 200 debut with third EP Worlds Apart in 2014. After follow-up EPs like 2015's The Throes of Winter and 2017's dance chart-topping Creation reflected a growing emphasis on song form, he landed just outside of the dance/electronic Top Ten with 2019's \"Need Your Love,\" a collaboration with Gryffin and singer/songwriter Noah Kahan. A decade into his recording career, he presented his first official album-length release, Beyond the Veil, in 2022.",
        isFavourite: false
       ),
    
    // Add more acts here
]

