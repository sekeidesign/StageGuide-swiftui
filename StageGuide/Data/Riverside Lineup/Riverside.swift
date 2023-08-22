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
    
    // ——————————— ** FRIDAY ACTS ** ———————————
    let vanpage = Act(context: context)
    vanpage.id = UUID()
    vanpage.name = "Vanpage"
    vanpage.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 0, timeZone: timeZone)
    vanpage.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 40, timeZone: timeZone)
    vanpage.imageName = "Acts/Vanpage"
    vanpage.bio = "DJ and Producer from Ottawa, Canada. Bundarr makes Tech House and Bass House as well as many different genres. You will get hooked by his infectious basslines and hard grooves!"
    vanpage.isFavorite = false
    //     ———
    let niceotope = Act(context: context)
    niceotope.id = UUID()
    niceotope.name = "Niceotope"
    niceotope.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 15, minute: 40, timeZone: timeZone)
    niceotope.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 16, minute: 20, timeZone: timeZone)
    niceotope.imageName = "Acts/Niceotope"
    niceotope.bio = "Niceotope is an electronic producer who takes influences from a wide variety of electronic genres. From all sorts of house music to downtempo and synthwave - Niceotope covers the spectrum."
    niceotope.isFavorite = false
    //     ———
    let paqs = Act(context: context)
    paqs.id = UUID()
    paqs.name = "PAQS"
    paqs.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 16, minute: 20, timeZone: timeZone)
    paqs.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 0, timeZone: timeZone)
    paqs.imageName = "Acts/Paqs"
    paqs.bio = "DJ and Producer from Ottawa, Canada. Bundarr makes Tech House and Bass House as well as many different genres. You will get hooked by his infectious basslines and hard grooves!"
    paqs.isFavorite = false
    //     ———
    let hamro = Act(context: context)
    hamro.id = UUID()
    hamro.name = "Hamro"
    hamro.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 0, timeZone: timeZone)
    hamro.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 50, timeZone: timeZone)
    hamro.imageName = "Acts/Hamro"
    hamro.bio = "Tarik Hamrouni aka Hamro is a 23 year old producer/DJ hailing from Ottawa, Canada who has quickly risen to become one of the most prominent up and coming artists in the underground dubstep and riddim world. Since 2018 Hamro has been diligently working on his sound design and social media presence which has caused major waves in the industry. With his eclectic sound design, undeniable consistent work ethic and uniquely pieced together songs that range from precise and beautiful melodies to heart pounding aggressive bass sounds, Hamro has truly become a leader for the revolution of the dubstep sound."
    hamro.isFavorite = false
    hamro.isFeatured = true
    //     ———
    let waves = Act(context: context)
    waves.id = UUID()
    waves.name = "Waves"
    waves.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 50, timeZone: timeZone)
    waves.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 40, timeZone: timeZone)
    waves.imageName = "Acts/Waves"
    waves.bio = "Frankie Grant & Spencer Bridle are the creative duo behind WAVES and share a love for producing and performing electronic dance music. Bridle leads on songwriting and production while Grant helms live performance, each adding to the other’s vision. \n Since signing a record deal with Ultra Records, the duo has received Canadian radio play on their first single \"Mr. Wilson\". They will look to build off their 2022 momentum and have set a goal to release as much music as possible in 2023. \n WAVES first batch of releases were “tropical house” influenced and clocked over 5 million streams on Spotify alone. They have since pivoted and are more focused on groovy house and club driven records. Stay tuned for the next wave."
    waves.isFavorite = false
    //     ———
    let laszewo = Act(context: context)
    laszewo.id = UUID()
    laszewo.name = "Laszewo"
    laszewo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 40, timeZone: timeZone)
    laszewo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 40, timeZone: timeZone)
    laszewo.imageName = "Acts/Laszewo"
    laszewo.bio = "we don’t know how to pronounce it either"
    laszewo.isFavorite = false
    //     ———
    let peekaboo = Act(context: context)
    peekaboo.id = UUID()
    peekaboo.name = "PEEKABOO"
    peekaboo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 40, timeZone: timeZone)
    peekaboo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 40, timeZone: timeZone)
    peekaboo.imageName = "Acts/Peekaboo"
    peekaboo.bio = "It’s easy to say that Matthew Lucas, a.k.a PEEKABOO, is the hottest act to break out in the electronic music scene in 2018. After a string of massively successful EP's, singles, and remixes, all within a few short months, audiences around the world have been captivated by PEEKABOO’s fresh, distinctive, and unique production style. His tracks, “Maniac”, and “Babatunde” have become iconic festival anthems, gaining support from the likes of Skrillex, Zeds Dead, Rezz, RL Grime, and the list goes on."
    peekaboo.isFavorite = false
    peekaboo.isFeatured = true
    //     ———
    let dvk = Act(context: context)
    dvk.id = UUID()
    dvk.name = "Deorro B2B Valentino Khan"
    dvk.shortName = "VK B2B Deorro"
    dvk.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 40, timeZone: timeZone)
    dvk.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 40, timeZone: timeZone)
    dvk.imageName = "Acts/VK & Deorro"
    dvk.bio = "A legendary back to back. Valentino Khan makes everything. The Los Angeles-based DJ and producer is an artist whose music knows no bounds. From producing hip-hop tracks for Grammy-winning artists to pumping out electronic anthems at top venues around the world, he's been breaking barriers with original tracks, production credentials and live sets. Los Angeles native Erick Orrosquieta, known as Deorro (and TON!C as well), is a house/EDM producer and DJ, as well as a proud Mexican American. After he developed a following through his SoundCloud page, he reached a wider audience in his early twenties, from 2012 through 2014, with extensive touring, as well as brash solo releases and collaborations on the Dim Mak and Mad Decent labels."
    dvk.isFavorite = false
    dvk.isFeatured = true
    //    ———
    let sevenLionsBreak = Act(context: context)
    sevenLionsBreak.id = UUID()
    sevenLionsBreak.name = "Intermission"
    sevenLionsBreak.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 40, timeZone: timeZone)
    sevenLionsBreak.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 45, timeZone: timeZone)
    sevenLionsBreak.bio = "Short intermission"
    sevenLionsBreak.isFavorite = false
    //    ———
    let sevenLions = Act(context: context)
    sevenLions.id = UUID()
    sevenLions.name = "Seven Lions"
    sevenLions.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 21, minute: 45, timeZone: timeZone)
    sevenLions.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 23, minute: 0, timeZone: timeZone)
    sevenLions.imageName = "Acts/Seven Lions"
    sevenLions.bio = "Melding mainstream pop, trance, and dubstep, California producer Jeff Montalvo quickly amassed a cult following under the alias Seven Lions, which issued the debut EP Days to Come in 2012. He made his Billboard 200 debut with third EP Worlds Apart in 2014. After follow-up EPs like 2015's The Throes of Winter and 2017's dance chart-topping Creation reflected a growing emphasis on song form, he landed just outside of the dance/electronic Top Ten with 2019's \"Need Your Love,\" a collaboration with Gryffin and singer/songwriter Noah Kahan. A decade into his recording career, he presented his first official album-length release, Beyond the Veil, in 2022."
    sevenLions.isFavorite = false
    sevenLions.isFeatured = true
    
    // ——————————— ** SATURDAY ACTS ** ———————————
    let matfroninja = Act(context: context)
    matfroninja.id = UUID()
    matfroninja.name = "MATFRONINJA"
    matfroninja.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 0, timeZone: timeZone)
    matfroninja.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 40, timeZone: timeZone)
    matfroninja.imageName = "Acts/Matfroninja"
    matfroninja.bio = "***UPDATE DESCRIPTION***"
    matfroninja.isFavorite = false
    //    ———
    let oliWest = Act(context: context)
    oliWest.id = UUID()
    oliWest.name = "Oli West"
    oliWest.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 40, timeZone: timeZone)
    oliWest.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 16, minute: 20, timeZone: timeZone)
    oliWest.imageName = "Acts/Oli West"
    oliWest.bio = "***UPDATE DESCRIPTION***"
    oliWest.isFavorite = false
    //    ———
    let etienneOzborne = Act(context: context)
    etienneOzborne.id = UUID()
    etienneOzborne.name = "Etienne Ozborne"
    etienneOzborne.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 16, minute: 20, timeZone: timeZone)
    etienneOzborne.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 17, minute: 20, timeZone: timeZone)
    etienneOzborne.imageName = "Acts/Etienne Ozborne"
    etienneOzborne.bio = "***UPDATE DESCRIPTION***"
    etienneOzborne.isFavorite = false
    //    ———
    let vavo = Act(context: context)
    vavo.id = UUID()
    vavo.name = "Vavo"
    vavo.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 17, minute: 20, timeZone: timeZone)
    vavo.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 18, minute: 20, timeZone: timeZone)
    vavo.imageName = "Acts/Vavo"
    vavo.bio = "***UPDATE DESCRIPTION***"
    vavo.isFavorite = false
    //    ———
    let wuki = Act(context: context)
    wuki.id = UUID()
    wuki.name = "Wuki"
    wuki.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 18, minute: 20, timeZone: timeZone)
    wuki.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 19, minute: 20, timeZone: timeZone)
    wuki.imageName = "Acts/Wuki"
    wuki.bio = "***UPDATE DESCRIPTION***"
    wuki.isFavorite = false
    wuki.isFeatured = true
    //    ———
    let hugel = Act(context: context)
    hugel.id = UUID()
    hugel.name = "Hugel"
    hugel.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 19, minute: 20, timeZone: timeZone)
    hugel.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 20, minute: 20, timeZone: timeZone)
    hugel.imageName = "Acts/Hugel"
    hugel.bio = "***UPDATE DESCRIPTION***"
    hugel.isFavorite = false
    hugel.isFeatured = true
    //    ———
    let adventureClubBreak = Act(context: context)
    adventureClubBreak.id = UUID()
    adventureClubBreak.name = "Intermission"
    adventureClubBreak.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 20, minute: 20, timeZone: timeZone)
    adventureClubBreak.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 20, minute: 25, timeZone: timeZone)
    adventureClubBreak.bio = "Short intermission"
    adventureClubBreak.isFavorite = false
    //    ———
    let adventureClub = Act(context: context)
    adventureClub.id = UUID()
    adventureClub.name = "Adventure Club"
    adventureClub.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 20, minute: 25, timeZone: timeZone)
    adventureClub.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 21, minute: 40, timeZone: timeZone)
    adventureClub.imageName = "Acts/Adventure Club"
    adventureClub.bio = "***UPDATE DESCRIPTION***"
    adventureClub.isFavorite = false
    adventureClub.isFeatured = true
    //    ———
    let twoFriendsBreak = Act(context: context)
    twoFriendsBreak.id = UUID()
    twoFriendsBreak.name = "Intermission"
    twoFriendsBreak.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 21, minute: 40, timeZone: timeZone)
    twoFriendsBreak.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 21, minute: 45, timeZone: timeZone)
    twoFriendsBreak.bio = "Short intermission"
    twoFriendsBreak.isFavorite = false
    //    ———
    let twoFriends = Act(context: context)
    twoFriends.id = UUID()
    twoFriends.name = "Two Friends"
    twoFriends.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 21, minute: 45, timeZone: timeZone)
    twoFriends.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 23, minute: 0, timeZone: timeZone)
    twoFriends.imageName = "Acts/Two Friends"
    twoFriends.bio = "***UPDATE DESCRIPTION***"
    twoFriends.isFavorite = false
    twoFriends.isFeatured = true
    //    ———
    let igluu = Act(context: context)
    igluu.id = UUID()
    igluu.name = "IGLUU"
    igluu.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 0, timeZone: timeZone)
    igluu.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 50, timeZone: timeZone)
    igluu.imageName = "Acts/Igluu"
    igluu.bio = "***UPDATE DESCRIPTION***"
    igluu.isFavorite = false
    //    ———
    let bundarr = Act(context: context)
    bundarr.id = UUID()
    bundarr.name = "Bundarr"
    bundarr.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 50, timeZone: timeZone)
    bundarr.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 16, minute: 40, timeZone: timeZone)
    bundarr.imageName = "Acts/Bundarr"
    bundarr.bio = "***UPDATE DESCRIPTION***"
    bundarr.isFavorite = false
    bundarr.isFeatured = true
    //    ———
    let luckyRose = Act(context: context)
    luckyRose.id = UUID()
    luckyRose.name = "Lucky Rose"
    luckyRose.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 16, minute: 40, timeZone: timeZone)
    luckyRose.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 17, minute: 40, timeZone: timeZone)
    luckyRose.imageName = "Acts/Lucky Rose"
    luckyRose.bio = "***UPDATE DESCRIPTION***"
    luckyRose.isFavorite = false
    //    ———
    let suraySertin = Act(context: context)
    suraySertin.id = UUID()
    suraySertin.name = "Suray Sertin"
    suraySertin.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 17, minute: 40, timeZone: timeZone)
    suraySertin.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 18, minute: 40, timeZone: timeZone)
    suraySertin.imageName = "Acts/Suray Sertin"
    suraySertin.bio = "***UPDATE DESCRIPTION***"
    suraySertin.isFavorite = false
    //    ———
    let dubdogz = Act(context: context)
    dubdogz.id = UUID()
    dubdogz.name = "Dubdogz"
    dubdogz.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 18, minute: 40, timeZone: timeZone)
    dubdogz.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 40, timeZone: timeZone)
    dubdogz.imageName = "Acts/Dubdogz"
    dubdogz.bio = "***UPDATE DESCRIPTION***"
    dubdogz.isFavorite = false
    //    ———
    let audienBreak = Act(context: context)
    audienBreak.id = UUID()
    audienBreak.name = "Break"
    audienBreak.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 40, timeZone: timeZone)
    audienBreak.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 45, timeZone: timeZone)
    audienBreak.bio = "***UPDATE DESCRIPTION***"
    audienBreak.isFavorite = false
    //    ———
    let audien = Act(context: context)
    audien.id = UUID()
    audien.name = "Audien"
    audien.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 45, timeZone: timeZone)
    audien.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 45, timeZone: timeZone)
    audien.imageName = "Acts/Audien"
    audien.bio = "***UPDATE DESCRIPTION***"
    audien.isFavorite = false
    audien.isFeatured = true
    //    ———
    let tchamiBreak = Act(context: context)
    tchamiBreak.id = UUID()
    tchamiBreak.name = "Intermission"
    tchamiBreak.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 45, timeZone: timeZone)
    tchamiBreak.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 50, timeZone: timeZone)
    tchamiBreak.bio = "***UPDATE DESCRIPTION***"
    tchamiBreak.isFavorite = false
    //    ———
    let tchami = Act(context: context)
    tchami.id = UUID()
    tchami.name = "Tchami"
    tchami.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 50, timeZone: timeZone)
    tchami.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 21, minute: 50, timeZone: timeZone)
    tchami.imageName = "Acts/Tchami"
    tchami.bio = "***UPDATE DESCRIPTION***"
    tchami.isFavorite = false
    tchami.isFeatured = true
    //    ———
    let zedsDeadBreak = Act(context: context)
    zedsDeadBreak.id = UUID()
    zedsDeadBreak.name = "Intermission"
    zedsDeadBreak.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 21, minute: 50, timeZone: timeZone)
    zedsDeadBreak.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 22, minute: 0, timeZone: timeZone)
    zedsDeadBreak.bio = "***UPDATE DESCRIPTION***"
    zedsDeadBreak.isFavorite = false
    //    ———
    let zedsDead = Act(context: context)
    zedsDead.id = UUID()
    zedsDead.name = "Zeds Dead"
    zedsDead.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 22, minute: 0, timeZone: timeZone)
    zedsDead.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 23, minute: 0, timeZone: timeZone)
    zedsDead.imageName = "Acts/Zeds Dead"
    zedsDead.bio = "***UPDATE DESCRIPTION***"
    zedsDead.isFavorite = false
    zedsDead.isFeatured = true
    
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
    
    let daysSet = NSOrderedSet(set: [friday, saturday, sunday])
    let fridayActsSet = NSSet(set: [vanpage, niceotope, paqs, hamro, waves, laszewo, peekaboo, dvk, sevenLionsBreak, sevenLions])
    let saturdayActsSet = NSSet(set: [matfroninja, oliWest, etienneOzborne, vavo, wuki, hugel, adventureClubBreak, adventureClub, twoFriendsBreak, twoFriends])
    let sundayActsSet = NSSet(set: [igluu, bundarr, luckyRose, suraySertin, dubdogz, audien, tchamiBreak, tchami, zedsDeadBreak, zedsDead])
    let stagesSet = NSSet(set: [mainStage])
    
    
    mainStage.days = daysSet
    let combinedActs = fridayActsSet.mutableCopy() as! NSMutableSet
    combinedActs.union(saturdayActsSet as! Set<AnyHashable>)
    combinedActs.union(sundayActsSet as! Set<AnyHashable>)
    mainStage.acts = combinedActs
    
    friday.acts = fridayActsSet
    friday.stages = stagesSet
    friday.festival = riverside
    
    saturday.acts = saturdayActsSet
    saturday.stages = stagesSet
    saturday.festival = riverside
    
    sunday.acts = sundayActsSet
    sunday.stages = stagesSet
    sunday.festival = riverside
    
    riverside.days = daysSet
    riverside.stages = stagesSet
    
    // Save the changes
    do {
        try context.save()
    } catch {
        fatalError("Error saving initial data: \(error.localizedDescription)")
    }
}
