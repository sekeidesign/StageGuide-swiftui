//
//  ActModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import CoreData
import SwiftUI

func populateInitialData() {
    let container = PersistenceController.shared.container
    let context = container.viewContext
    let timeZone = "America/New_York"
    
    // ——————————— FRIDAY ACTS ———————————
    let vanpage = Act(context: context)
    vanpage.id = UUID()
    vanpage.name = "Vanpage"
    vanpage.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 0, timeZone: timeZone)
    vanpage.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 45, timeZone: timeZone)
    vanpage.imageName = "Acts/Vanpage"
    vanpage.bio = "DJ and Producer from Ottawa, Canada. Bundarr makes Tech House and Bass House as well as many different genres. You will get hooked by his infectious basslines and hard grooves!"
    vanpage.isFavorite = false
    //     ———
    let niceotope = Act(context: context)
    niceotope.id = UUID()
    niceotope.name = "Niceotope"
    niceotope.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 45, timeZone: timeZone)
    niceotope.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 16, minute: 30, timeZone: timeZone)
    niceotope.imageName = "Acts/Niceotope"
    niceotope.bio = "Niceotope is an electronic producer who takes influences from a wide variety of electronic genres. From all sorts of house music to downtempo and synthwave - Niceotope covers the spectrum."
    niceotope.isFavorite = false
    niceotope.isFeatured = true
    //     ———
    let paqs = Act(context: context)
    paqs.id = UUID()
    paqs.name = "PAQS"
    paqs.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 16, minute: 30, timeZone: timeZone)
    paqs.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 15, timeZone: timeZone)
    paqs.imageName = "Acts/Paqs"
    paqs.bio = "DJ and Producer from Ottawa, Canada. Bundarr makes Tech House and Bass House as well as many different genres. You will get hooked by his infectious basslines and hard grooves!"
    paqs.isFavorite = false
    //     ———
    let hamro = Act(context: context)
    hamro.id = UUID()
    hamro.name = "Hamro"
    hamro.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 15, timeZone: timeZone)
    hamro.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 0, timeZone: timeZone)
    hamro.imageName = "Acts/Hamro"
    hamro.bio = "Tarik Hamrouni aka Hamro is a 23 year old producer/DJ hailing from Ottawa, Canada who has quickly risen to become one of the most prominent up and coming artists in the underground dubstep and riddim world. Since 2018 Hamro has been diligently working on his sound design and social media presence which has caused major waves in the industry. With his eclectic sound design, undeniable consistent work ethic and uniquely pieced together songs that range from precise and beautiful melodies to heart pounding aggressive bass sounds, Hamro has truly become a leader for the revolution of the dubstep sound."
    hamro.isFavorite = false
    hamro.isFeatured = true
    //     ———
    let waves = Act(context: context)
    waves.id = UUID()
    waves.name = "Waves"
    waves.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 0, timeZone: timeZone)
    waves.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0, timeZone: timeZone)
    waves.imageName = "Acts/Waves"
    waves.bio = "Frankie Grant & Spencer Bridle are the creative duo behind WAVES and share a love for producing and performing electronic dance music. Bridle leads on songwriting and production while Grant helms live performance, each adding to the other’s vision. \n Since signing a record deal with Ultra Records, the duo has received Canadian radio play on their first single \"Mr. Wilson\". They will look to build off their 2022 momentum and have set a goal to release as much music as possible in 2023. \n WAVES first batch of releases were “tropical house” influenced and clocked over 5 million streams on Spotify alone. They have since pivoted and are more focused on groovy house and club driven records. Stay tuned for the next wave."
    waves.isFavorite = false
    //     ———
    let laszewo = Act(context: context)
    laszewo.id = UUID()
    laszewo.name = "Laszewo"
    laszewo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0, timeZone: timeZone)
    laszewo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 0, timeZone: timeZone)
    laszewo.imageName = "Acts/Laszewo"
    laszewo.bio = "we don’t know how to pronounce it either"
    laszewo.isFavorite = false
    //     ———
    let peekaboo = Act(context: context)
    peekaboo.id = UUID()
    peekaboo.name = "PEEKABOO"
    peekaboo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 0, timeZone: timeZone)
    peekaboo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 0, timeZone: timeZone)
    peekaboo.imageName = "Acts/Peekaboo"
    peekaboo.bio = "It’s easy to say that Matthew Lucas, a.k.a PEEKABOO, is the hottest act to break out in the electronic music scene in 2018. After a string of massively successful EP's, singles, and remixes, all within a few short months, audiences around the world have been captivated by PEEKABOO’s fresh, distinctive, and unique production style. His tracks, “Maniac”, and “Babatunde” have become iconic festival anthems, gaining support from the likes of Skrillex, Zeds Dead, Rezz, RL Grime, and the list goes on."
    peekaboo.isFavorite = false
    peekaboo.isFeatured = true
    //     ———
    let dvk = Act(context: context)
    dvk.id = UUID()
    dvk.name = "Deorro B2B Valentino Khan"
    dvk.shortName = "VK B2B Deorro"
    dvk.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 0, timeZone: timeZone)
    dvk.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 22, minute: 0, timeZone: timeZone)
    dvk.imageName = "Acts/VK & Deorro"
    dvk.bio = "A legendary back to back. Valentino Khan makes everything. The Los Angeles-based DJ and producer is an artist whose music knows no bounds. From producing hip-hop tracks for Grammy-winning artists to pumping out electronic anthems at top venues around the world, he's been breaking barriers with original tracks, production credentials and live sets. Los Angeles native Erick Orrosquieta, known as Deorro (and TON!C as well), is a house/EDM producer and DJ, as well as a proud Mexican American. After he developed a following through his SoundCloud page, he reached a wider audience in his early twenties, from 2012 through 2014, with extensive touring, as well as brash solo releases and collaborations on the Dim Mak and Mad Decent labels."
    dvk.isFavorite = false
    dvk.isFeatured = true
    //    ———
    let sevenLions = Act(context: context)
    sevenLions.id = UUID()
    sevenLions.name = "Seven Lions"
    sevenLions.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 22, minute: 0, timeZone: timeZone)
    sevenLions.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 23, minute: 0, timeZone: timeZone)
    sevenLions.imageName = "Acts/Seven Lions"
    sevenLions.bio = "Melding mainstream pop, trance, and dubstep, California producer Jeff Montalvo quickly amassed a cult following under the alias Seven Lions, which issued the debut EP Days to Come in 2012. He made his Billboard 200 debut with third EP Worlds Apart in 2014. After follow-up EPs like 2015's The Throes of Winter and 2017's dance chart-topping Creation reflected a growing emphasis on song form, he landed just outside of the dance/electronic Top Ten with 2019's \"Need Your Love,\" a collaboration with Gryffin and singer/songwriter Noah Kahan. A decade into his recording career, he presented his first official album-length release, Beyond the Veil, in 2022."
    sevenLions.isFavorite = false
    
    
    // ——————————— STAGES ———————————
    let mainStage = Stage(context: context)
    mainStage.name = "Main"
    
    
    // ——————————— DAYS ———————————
    let friday = Day(context: context)
    friday.name = "Friday"
    friday.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 0, timeZone: timeZone)
    friday.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 23, minute: 0, timeZone: timeZone)
    
    let saturday = Day(context: context)
    saturday.name = "Saturday"
    saturday.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 0, timeZone: timeZone)
    saturday.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 23, minute: 0, timeZone: timeZone)
    
    let sunday = Day(context: context)
    sunday.name = "Sunday"
    sunday.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 0, timeZone: timeZone)
    sunday.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 23, minute: 0, timeZone: timeZone)
    
    
    
    // ——————————— FESTIVAL ———————————
    let riverside = Festival(context: context)
    riverside.name = "Riverside"
    riverside.bio = "Gatineau's only electronic music festival is back on September 8-9-10. This year is the 10th anniversary of the festival and it’s going to be completely CRAZY! You don’t want to miss it."
    riverside.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 0, timeZone: timeZone)
    riverside.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 23, minute: 0, timeZone: timeZone)
    riverside.isSaved = true
    riverside.imageName = "Riverside Image"
    riverside.logoName = "Riverside Logo"
    riverside.address = "100 Laurier St, Gatineau, Quebec"
    
    let daysSet = NSOrderedSet(set: [friday])
    let fridayActsSet = NSSet(set: [vanpage, niceotope, paqs, hamro, waves, laszewo, peekaboo, dvk, sevenLions])
    let stagesSet = NSSet(set: [mainStage])
    
    
    mainStage.days = daysSet
    mainStage.acts = fridayActsSet
    
    friday.acts = fridayActsSet
    friday.stages = stagesSet
    friday.festival = riverside
    
    riverside.days = daysSet
    riverside.stages = stagesSet
    
    // Save the changes
    do {
        try context.save()
    } catch {
        fatalError("Error saving initial data: \(error.localizedDescription)")
    }
}
