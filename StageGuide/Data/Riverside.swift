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
    vanpage.bio = "Whether in intimate club settings or expansive festival stages, let Vanpage guide you through a dynamic musical journey that echoes the essence of Ottawa's vibrant energy."
    vanpage.links = ["https://www.instagram.com/vanpagex/", "https://soundcloud.com/paige-van-dinther"]
    vanpage.isFavorite = false
    //     ———
    let niceotope = Act(context: context)
    niceotope.id = UUID()
    niceotope.name = "Niceotope"
    niceotope.startTime = dateFrom(year: 2023, month: 9, day: 2, hour: 15, minute: 40, timeZone: timeZone)
    niceotope.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 16, minute: 20, timeZone: timeZone)
    niceotope.imageName = "Acts/Niceotope"
    niceotope.bio = "Niceotope is an electronic producer who takes influences from a wide variety of electronic genres. From all sorts of house music to downtempo and synthwave - Niceotope covers the spectrum."
    niceotope.links = ["https://www.instagram.com/niceotope/", "https://www.facebook.com/Niceotope", "https://twitter.com/niceotope",  "https://soundcloud.com/niceotope", "https://open.spotify.com/artist/7aMxWqpL1v0ziq6guTVcNR?si=zeyiTV9NQimORLhcBYem3w"]
    niceotope.isFavorite = false
    //     ———
    let paqs = Act(context: context)
    paqs.id = UUID()
    paqs.name = "PAQS"
    paqs.startTime = dateFrom(year: 2023, month: 9, day: 2, hour: 16, minute: 20, timeZone: timeZone)
    paqs.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 0, timeZone: timeZone)
    paqs.imageName = "Acts/Paqs"
    paqs.bio = "Dive into the electrifying sounds of PAQS, the house DJ hailing from the vibrant city of Ottawa. With a passion for crafting sonic landscapes that transcend boundaries, PAQS has emerged as a driving force in the local music scene."
    paqs.links = ["https://www.instagram.com/paqsofficial/", "https://www.youtube.com/c/PaqsPaqs", "https://tiktok.com/@paqsofficial", "https://soundcloud.com/paqsmusic", "https://open.spotify.com/artist/3wVvompAinPGfNoXB9SVNL?si=5ZU2n4OtReSMdr16_hwUBA"]
    paqs.isFavorite = false
    //     ———
    let hamro = Act(context: context)
    hamro.id = UUID()
    hamro.name = "HAMRO"
    hamro.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 0, timeZone: timeZone)
    hamro.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 17, minute: 50, timeZone: timeZone)
    hamro.imageName = "Acts/Hamro"
    hamro.bio = "Tarik Hamrouni aka Hamro is a 23 year old producer/DJ hailing from Ottawa, Canada who has quickly risen to become one of the most prominent up and coming artists in the underground dubstep and riddim world. Since 2018 Hamro has been diligently working on his sound design and social media presence which has caused major waves in the industry. With his eclectic sound design, undeniable consistent work ethic and uniquely pieced together songs that range from precise and beautiful melodies to heart pounding aggressive bass sounds, Hamro has truly become a leader for the revolution of the dubstep sound."
    hamro.links = ["https://www.facebook.com/djhamro", "https://www.facebook.com/djhamro", "https://twitter.com/djhamro", "https://www.tiktok.com/@djhamro?lang=en", "https://soundcloud.com/djhamro", "https://open.spotify.com/artist/45tIGuLKx3RA70cm4rnSLH?si=9DrRBcVSQRGnx5dGKLkIig"]
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
    waves.links = ["https://www.instagram.com/wearewaves/", "https://twitter.com/djwavesmusic", "https://www.tiktok.com/@wearewaves?lang=en", "https://open.spotify.com/artist/6p32HfiKpYD3wdKHV7utxQ"]
    waves.isFavorite = false
    //     ———
    let laszewo = Act(context: context)
    laszewo.id = UUID()
    laszewo.name = "Laszewo"
    laszewo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 40, timeZone: timeZone)
    laszewo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 40, timeZone: timeZone)
    laszewo.imageName = "Acts/Laszewo"
    laszewo.bio = "we don’t know how to pronounce it either"
    laszewo.links = ["https://www.instagram.com/laszewo/", "https://www.tiktok.com/@laszewooo?is_from_webapp=1&sender_device=pc", "https://www.youtube.com/channel/UCnOZUDbRc2Ae76IhROupOfA/videos?sub_confirmation=1", "https://soundcloud.com/laszewo", "https://open.spotify.com/artist/6jxGLrn1I14RIeRYodOpLN?si=vNVkq9zxQd2dL_NrQYjpcw&nd=1"]
    laszewo.isFavorite = false
    //     ———
    let peekaboo = Act(context: context)
    peekaboo.id = UUID()
    peekaboo.name = "PEEKABOO"
    peekaboo.startTime = dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 40, timeZone: timeZone)
    peekaboo.endTime = dateFrom(year: 2023, month: 9, day: 8, hour: 20, minute: 40, timeZone: timeZone)
    peekaboo.imageName = "Acts/Peekaboo"
    peekaboo.bio = "It’s easy to say that Matthew Lucas, a.k.a PEEKABOO, is the hottest act to break out in the electronic music scene in 2018. After a string of massively successful EP's, singles, and remixes, all within a few short months, audiences around the world have been captivated by PEEKABOO’s fresh, distinctive, and unique production style. His tracks, “Maniac”, and “Babatunde” have become iconic festival anthems, gaining support from the likes of Skrillex, Zeds Dead, Rezz, RL Grime, and the list goes on."
    peekaboo.links = ["https://instagram.com/peekaboobeats", "https://www.facebook.com/peekaboobeats", "https://twitter.com/peekaboobeats", "https://tiktok.com/@peekaboobeats", "https://soundcloud.com/peekaboobeats", "https://open.spotify.com/artist/4Ok1Cm5YX5StCQZgH0r2xF"]
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
    dvk.links = ["https://valentinokhan.com/", "https://deorro.com/"]
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
    sevenLions.links = ["https://www.facebook.com/SevenLions", "https://twitter.com/SevenLionsMusic", "https://www.youtube.com/channel/UChVfER-3s533FTh8Uae0Rhg", "https://soundcloud.com/seven-lions", "https://open.spotify.com/artist/6fcTRFpz0yH79qSKfof7lp", "https://google.com"]
    sevenLions.isFavorite = false
    sevenLions.isFeatured = true
    
    // ——————————— ** SATURDAY ACTS ** ———————————
    let matfroninja = Act(context: context)
    matfroninja.id = UUID()
    matfroninja.name = "MATFRONINJA"
    matfroninja.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 0, timeZone: timeZone)
    matfroninja.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 40, timeZone: timeZone)
    matfroninja.imageName = "Acts/Matfroninja"
    matfroninja.bio = "Unlike most artists Matfroninja doesn't focus on one style/genre, or have different names for different projects. Matfroninja is not just some brand he's built, it's everything that encompasses him...good and bad. He's always looking to create genre bending songs, although future bass is definitely his bread and butter."
    matfroninja.links = ["https://www.instagram.com/matfroninja/", "https://www.youtube.com/channel/UC8JSU4mYl0KfEuDWd1foMyQ", "https://www.instagram.com/matfroninja/", "https://vm.tiktok.com/ZMjeY7Rp4/", "https://soundcloud.com/matfroninja", "https://open.spotify.com/artist/42L9z0w9T9yyJAwLmlY6XJ?si=NSTI2WDfR3OjwaZwTOrCPw"]
    matfroninja.isFavorite = false
    //    ———
    let oliWest = Act(context: context)
    oliWest.id = UUID()
    oliWest.name = "Oli West"
    oliWest.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 15, minute: 40, timeZone: timeZone)
    oliWest.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 16, minute: 20, timeZone: timeZone)
    oliWest.imageName = "Acts/Oli West"
    oliWest.bio = "Canadian producer & DJ Oli West grew up in a deeply musical household and was exposed to countless genres throughout his childhood, ranging from classical music, to 60s soft rock to Malian folk music. He fell in love with electronic music after stumbling upon Strobe by Deadmau5 in 2011, and started producing music just a couple of years later at the tender age of 14. He burst onto Ottawa’s dance music scene in 2022 with his dark, groovy and uniquely hypnotic sound, earning regular headlining shows at the Canadian Capital’s hottest clubs. His growth and development has continued to be exponential in 2023 with his latest releases."
    oliWest.links = ["https://www.instagram.com/oliwestmusic/", "https://soundcloud.app.goo.gl/14epBsLyTPkfrNaY7", "https://open.spotify.com/artist/4nEhQtFiZrBvvvcbsRYPol?si=BiBG1PfDTLSgyTJwVAGDFw"]
    oliWest.isFavorite = false
    //    ———
    let etienneOzborne = Act(context: context)
    etienneOzborne.id = UUID()
    etienneOzborne.name = "Etienne Ozborne"
    etienneOzborne.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 16, minute: 20, timeZone: timeZone)
    etienneOzborne.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 17, minute: 20, timeZone: timeZone)
    etienneOzborne.imageName = "Acts/Etienne Ozborne"
    etienneOzborne.bio = "Etienne is a monthly resident at Montreal’s New City Gas and Circus Afterhours, both clubs having at one time or another been featured in DJ Mag’s Top 100 clubs. He also recently signed on as monthly resident at Club Aléa located inside the Casino Lac Leamy in Gatineau, Québec. On the international circuit, Etienne has been an in-demand DJ having played notably in the United States, Russia, Mexico, Brazil, South Korea, Maldives Island and Germany. Etienne is entering the pinnacle of his career and is destined for great success. His dancefloor experience and distinctive style make him one of the most promising and exciting DJ’s to watch in 2017."
    etienneOzborne.links = ["https://www.facebook.com/EtienneOzborne/", "https://open.spotify.com/artist/7bzairu1T7FcC67iXENiEH?si=3TdXd9qKStK2qTJkyOQIJg"]
    etienneOzborne.isFavorite = false
    //    ———
    let vavo = Act(context: context)
    vavo.id = UUID()
    vavo.name = "Vavo"
    vavo.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 17, minute: 20, timeZone: timeZone)
    vavo.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 18, minute: 20, timeZone: timeZone)
    vavo.imageName = "Acts/Vavo"
    vavo.bio = "VAVO, the genre-bending DJ/Producer duo comprised of Jesse Fischer and Alden Martin, have been making serious moves in the music industry. The Vancouver native and London-born pair have garnered impressive milestones, including multiple #1 spots on Dance Radio USA and hitting the top 3 on the Billboard Dance Charts. However, it's their explosive YEEDM movement that's been turning heads and making waves across the music world in 2023. Blending EDM and Country, this unique movement has gone viral and been embraced by fans with open arms. \n VAVO's A-grade approach to production has earned them the support of industry heavyweights such as Tiësto, The Chainsmokers, and David Guetta. Their hard work, signature sound, and memorable singles have led them to be recognized as a Billboard charting Dance/Pop/Country crossover act that's always happy to be pushing boundaries."
    vavo.links = ["http://instagram.com/vavomusic", "https://twitter.com/VAVOmusic", "https://www.facebook.com/vavomusic/", "http://soundcloud.com/vavomusic", "https://open.spotify.com/artist/44re77WwNG34C182Jq3WIK"]
    vavo.isFavorite = false
    //    ———
    let wuki = Act(context: context)
    wuki.id = UUID()
    wuki.name = "Wuki"
    wuki.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 18, minute: 20, timeZone: timeZone)
    wuki.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 19, minute: 20, timeZone: timeZone)
    wuki.imageName = "Acts/Wuki"
    wuki.bio = "Wuki is the genre-blending solo project of Los Angeles-based producer Kris Barman. Influenced by the sounds of Detroit ghettotech and Chicago footwork scenes, Barman’s ability to seamlessly mix booty, breaks, electro, and house into hard-hitting club-shakers has become a trademark of the Wuki sound. The ever evolving Wuki, has done official remixes for some of Electronic Music’s top artists including for The Chainsmokers, RL Grime, Kill The Noise, Galantis and has releases on notable imprints such as Mad Decent, OWSLA and more."
    wuki.links = ["https://www.instagram.com/wuki/", "https://www.facebook.com/IAMwuki/", "https://www.tiktok.com/@wukiwukiwuki?source=h5_m", "https://www.youtube.com/c/wuki", "https://soundcloud.com/iamwuki", "https://open.spotify.com/artist/6Se1y4vDcu9fVHLqdj1N3q?si=BKtntpeHTYaNZolLBlc_pA"]
    wuki.isFavorite = false
    wuki.isFeatured = true
    //    ———
    let hugel = Act(context: context)
    hugel.id = UUID()
    hugel.name = "HUGEL"
    hugel.startTime = dateFrom(year: 2023, month: 9, day: 9, hour: 19, minute: 20, timeZone: timeZone)
    hugel.endTime = dateFrom(year: 2023, month: 9, day: 9, hour: 20, minute: 20, timeZone: timeZone)
    hugel.imageName = "Acts/Hugel"
    hugel.bio = "Instigator of the Latin House movement with his hit \"Morenita\". HUGEL is a multi gold and platinum selling artist with over 1 Billion streams to his name, and with many of his tracks reaching the number 1 spot on Beatport, his music is played in parties all over the world. \n He grew up in Marseille by the Mediteranean sea (South of France) His Mom raised him with funk, disco and soul. He discovered the art of Dj’ing with vinyls at the age of 16 years old, influenced by the likes of Carl Cox, Laurent Garnier, Daft Punk, Amine Edge and David Guetta. After few years learning production he became a Hit-Maker. His house music is inspired by ibiza (Spain) and the Latin culture that he soaked up during his time living on the Island. Selling out shows in America, Space (Miami), Superior ingredients (Nyc), Academy (Los Angeles) He’s had residencies at Pacha & Ushuaia in Ibiza, and has played the biggest festivals in the world such as: EDC Vegas, EDC Mexico, Tomorrowland, Lollapalooza, Parookaville, World Club Dome, Mysteryland."
    hugel.links = ["https://www.instagram.com/hugelthug/", "https://www.djhugel.com/", "https://www.youtube.com/@HUGELMUSIC", "https://soundcloud.com/hugelmusic", "https://open.spotify.com/artist/5PlfkPxwCpRRWQJBxCa0By"]
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
    adventureClub.bio = "Grammy nominated electronic duo from Montreal, Canada. Our real names are Leighton and Christian. \n Some people say we invented melodic bass."
    adventureClub.links = ["https://www.instagram.com/adventureclub", "https://www.facebook.com/adventureclub", "https://twitter.com/adventureclub", "https://www.youtube.com/user/adventureclubdubstep", "https://soundcloud.com/adventureclub", "https://open.spotify.com/artist/5CdJjUi9f0cVgo9nFuJrFa?si=3bFJ6d7lT5u7s8JndyJWeQ"]
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
    twoFriends.links = ["https://www.instagram.com/twofriends/", "https://www.facebook.com/twofriendsmusic", "https://twitter.com/twofriendsmusic", "https://www.youtube.com/c/TwoFriendsMusic", "https://open.spotify.com/artist/44Ewva5aHOX00EwaX2D2mh?si=MK4YIs4sRXa9103133riow", "https://soundcloud.com/two-friends"]
    twoFriends.imageName = "Acts/Two Friends"
    twoFriends.bio = "Two Friends is the musical creation of best friends Matt Halper and Eli Sones. The dance-pop duo’s fitting name is a reflection of their lifelong bond as both musical collaborators and best friends.  They exploded into the global dance music landscape with their originals, their viral remixes of The Killers’ “Mr. Brightside,” Blink 182’s “I Miss You,” and their award-winning Big Bootie Mix series. Amassing millions of streams across YouTube and SoundCloud per installment, the Big Bootie Mix series has become the soundtrack to many a good-night-out across 10 years of regular releases.  With their intricately-produced live sets, Two Friends have performed at iconic venues from the likes of Red Rocks, Northerly Island, and Forest Hills Stadium, just to name a few. At the heels of their sold-out 2023 Planet Two Friends tour, the pair continue their ascent to the upper echelons of dance-pop excellence via new original productions, a relentless touring schedule, and the burgeoning of the Big Bootie Universe. As they continue building a legacy crossover brand, Matt and Eli will always just be Two Friends."
    twoFriends.isFavorite = false
    twoFriends.isFeatured = true
    //    ———
    let igluu = Act(context: context)
    igluu.id = UUID()
    igluu.name = "IGLUU"
    igluu.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 0, timeZone: timeZone)
    igluu.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 50, timeZone: timeZone)
    igluu.imageName = "Acts/Igluu"
    igluu.bio = "Delving into the darker and more hypnotic corners of electronic music, Igluu captures the essence of the city's industrial vibe and transforms it into pulsating beats that challenge norms. Drawing inspiration from Ottawa's gritty underground scene, their sets are a fusion of expert sonic craftsmanship, blending intricate textures with unwavering rhythms that venture beyond the expected."
    igluu.links = ["https://www.instagram.com/igluu.music/", "https://soundcloud.com/igluuhouse"]
    igluu.isFavorite = false
    //    ———
    let bundarr = Act(context: context)
    bundarr.id = UUID()
    bundarr.name = "Bundarr"
    bundarr.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 15, minute: 50, timeZone: timeZone)
    bundarr.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 16, minute: 40, timeZone: timeZone)
    bundarr.imageName = "Acts/Bundarr"
    bundarr.bio = "DJ/Producer Bundarr thrives on the art of genre-blending, with an insatiable appetite for all things bass. From the depths of bass house to the heights of 400bpm hardcore, his music embodies the essence of controlled chaos, uniting all genres with a shared love for volume. Rooted in Ottawa's vibrant scene, Bundarr's sets are a dynamic showcase of his passion for delivering powerful, ear-rattling experiences."
    bundarr.links = ["https://www.instagram.com/bundarrmusic/", "https://soundcloud.com/bundarr", "https://open.spotify.com/artist/5KL3rf2ky4z1moGQXX2rqG?si=iLP_YvN_SmuxU1xmcvtYoA"]
    bundarr.isFavorite = false
    bundarr.isFeatured = true
    //    ———
    let luckyRose = Act(context: context)
    luckyRose.id = UUID()
    luckyRose.name = "Lucky Rose"
    luckyRose.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 16, minute: 40, timeZone: timeZone)
    luckyRose.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 17, minute: 40, timeZone: timeZone)
    luckyRose.imageName = "Acts/Lucky Rose"
    luckyRose.bio = "Lucky Rose is producers/DJs Vincent Carrier and Marc-Antoine Thibeault, a French-Canadian duo with their signature mix of bright beats, catchy hooks and organic instruments. \n It started as Carrier’s solo project in 2015, albeit unintentionally. While remixing other artists from his Quebec City hometown, Carrier wrote original tropical house jam “The Way You Want Me.” When nobody else wanted it, he brought in vocalist Yan Etchevary and released it as Lucky Rose.  Supported by buzzy YouTube channels with millions of subs, the song soon made it to Stingray Music and then Montreal radio. From there, Lucky Rose won Virgin Radio’s Future Star contest, climbed Canada’s Billboard Top 40 and Hot AC charts and got signed by Ultra Music.  Carrier’s next release, “Wild One,” featuring Toronto singer-producer Tep No, was even bigger. Riding soaring synths, acoustic guitar strums and an earworm whistle, it clocked tens of millions of streams, cracked pop radio’s top 20 and went Gold in Canada. \n Still, something was missing — and that something turned out to be Thibeault, a Facebook friend, DJ and fellow ex-drummer who’d ditched rock for electronic dance music. Complementing each other's skill sets, the pair joined forces in 2017 and put out “Lost” featuring Jordan Hart which again went Gold and cracked pop radio while getting them live gigs.   Now with some hot new pandemic-era productions in hand, Lucky Rose is ready to prove they’re no fluke."
    luckyRose.links = ["https://www.instagram.com/luckyroseofficial/", "https://www.tiktok.com/@luckyrosemusic", "https://luckyrosemusic.com/", "https://soundcloud.com/lucky-rose-music", "https://open.spotify.com/artist/5ShkaitLUorYdZgJMqTF5E?si=jg2hEF2uQvS0XyxRqgVFvA"]
    luckyRose.isFavorite = false
    //    ———
    let suraySertin = Act(context: context)
    suraySertin.id = UUID()
    suraySertin.name = "Suray Sertin"
    suraySertin.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 17, minute: 40, timeZone: timeZone)
    suraySertin.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 18, minute: 40, timeZone: timeZone)
    suraySertin.imageName = "Acts/Suray Sertin"
    suraySertin.bio = "Suray Sertin is a record producer hailing from Montreal, Canada. \n With his unique blend of house, chillwave, r&b, and pop, he creates a sound that is both fresh and timeless. His music is an artful combination of musical elements and textures, resulting in an immersive listening experience that captivates the senses. As a producer, Suray's approach to music-making is constantly evolving, and his quest for innovation is establishing him as a leading figure in the Montreal electronic music scene. \n Suray Sertin's innovative sound has captured the attention of heavyweights in the electronic music scene, including Zeds Dead, and playlist curators at Higher Ground and Foreign Family Collective. With support from these industry leaders, he is cementing his place as a standout in the electronic music world."
    suraySertin.links = ["https://instagram.com/suraysertin", "https://twitter.com/suraysertin", "https://tiktok.com/@suraysertin", "https://soundcloud.com/suraysertin", "https://open.spotify.com/artist/4Fne9Gai1GmN22jvAENRtP?si=3fX74nF-QryXT9NYhu7sRQ"]
    suraySertin.isFavorite = false
    //    ———
    let dubdogz = Act(context: context)
    dubdogz.id = UUID()
    dubdogz.name = "DUBDOGZ"
    dubdogz.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 18, minute: 40, timeZone: timeZone)
    dubdogz.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 40, timeZone: timeZone)
    dubdogz.imageName = "Acts/Dubdogz"
    dubdogz.bio = "Brazil’s fastest rising stars, Dubdogz have taken the Electronic music world by storm. Though still in their early twenties the twin brothers -Marcos & Lucas Schmidt- are already one of the leading electronic acts in Brazil with numerous hit dance tracks in South America, Europe and North America. The duo has to their credit performances at major festivals such as Rock In Rio, Lollapalooza, Tomorrowland Brazil, XXXperience, Electric Zoo and Ultra Music Brazil. Known for their high energy performances, pulsating dance rhythms of Brazilian Bass and instantly contagious melodies, Dubdogz is now focused on the world with new original tracks, new collaborations and remixes underway."
    dubdogz.links = ["https://www.instagram.com/dubdogz/", "https://twitter.com/dubdogzmusic", "https://www.youtube.com/c/Dubdogz", "https://dubdogz.com.br/", "https://soundcloud.com/dubdogzmusic", "https://open.spotify.com/artist/4cdyqaBREB68H77QKCrKP1"]
    dubdogz.isFavorite = false
    //    ———
    let audienBreak = Act(context: context)
    audienBreak.id = UUID()
    audienBreak.name = "Intermission"
    audienBreak.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 40, timeZone: timeZone)
    audienBreak.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 45, timeZone: timeZone)
    audienBreak.bio = "Short intermission."
    audienBreak.isFavorite = false
    //    ———
    let audien = Act(context: context)
    audien.id = UUID()
    audien.name = "Audien"
    audien.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 19, minute: 45, timeZone: timeZone)
    audien.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 45, timeZone: timeZone)
    audien.imageName = "Acts/Audien"
    audien.bio = "Grammy nominated producer and songwriter Audien has established himself as a fixture in the dance community, known for his production prowess and unique propensity for uplifting melodies. Considered a staple in the progressive house genre, Audien launched his career in 2008 with a string of releases on Anjunabeats, Armada Music, Spinnin’ Records, and Astralwerks. Over the years Audien solidified his signature sound and garnered the support of industry veterans like Tiësto, Above & Beyond, and Armin van Buuren. In 2014, Audien released his Grammy nominated remix of Bastille’s “Pompeii”, which went on to become the most played track at Electric Daisy Carnival and Coachella, and one of the five most played tracks at Tomorrowland. It is no surprise then that Audien has become a mainstay at marquee festival brands across the world including Tomorrowland, EDC, Ultra, Lollapalooza, and many more. Audien’s career growth and influence is evidenced by his impressive list of collaborators, which include Lady Antebellum, MAX, and Echosmith, on top of official remixes for Michael Jackson, Coldplay, and Halsey. Audien released his debut LP ‘Escapism’ in November 2019. The album is a definitive effort encapsulating both Audien’s signature style and his dominance in the dance landscape. Audien states, “I’m not reinventing the wheel, but I’m accentuating the art I’ve created for almost a decade. It’s the best form of what I’m known for.”"
    audien.links = ["https://www.instagram.com/audien/?hl=en", "https://soundcloud.com/audien", "https://twitter.com/audien", "https://www.youtube.com/user/AudienTV", "https://open.spotify.com/artist/4xnMDfgEmXZEEDdITKcGuE"]
    audien.isFavorite = false
    audien.isFeatured = true
    //    ———
    let tchamiBreak = Act(context: context)
    tchamiBreak.id = UUID()
    tchamiBreak.name = "Intermission"
    tchamiBreak.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 45, timeZone: timeZone)
    tchamiBreak.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 50, timeZone: timeZone)
    tchamiBreak.bio = "Short intermission."
    tchamiBreak.isFavorite = false
    //    ———
    let tchami = Act(context: context)
    tchami.id = UUID()
    tchami.name = "Tchami"
    tchami.startTime = dateFrom(year: 2023, month: 9, day: 10, hour: 20, minute: 50, timeZone: timeZone)
    tchami.endTime = dateFrom(year: 2023, month: 9, day: 10, hour: 21, minute: 50, timeZone: timeZone)
    tchami.imageName = "Acts/Tchami"
    tchami.bio = "Tchami is one of the world's most popular DJs, and alongside his friends and partners DJ Snake, Malaa and Mercer, he's helping to push dance music forward via the future house movement, a collection of artists seeking to honor the history of dance music by continually finding innovative ways to add new sounds and textures while staying true to the core tenets of the house aesthetic. Born Martin Bresso in Paris, France, Tchami was a regular fixture at the record store Samad, studying classic house, r&amp;b and hip-hop imported from England and America. He began producing around town finding his voice, and eventually hit upon a sound that's equally energetic and soulful - one capable of moving audiences and leaving them with a feeling of deep bliss. \n Tchami tours the globe most days out of the year, and has played major international festivals including the Ultra Music Festivals, Electric Daisy Carnival, HARD Summer Music Festival, Coachella, multiple iterations of Lollapalooza (US, Paris, Brazil) and VELD Music Festival, to name just a few, always with the goal to take the audience higher and higher."
    tchami.links = ["https://www.instagram.com/tchami/", "https://www.instagram.com/tchami/", "https://twitter.com/iamTchami", "https://www.youtube.com/user/TchamiTV", "https://soundcloud.com/iamtchami", "https://open.spotify.com/artist/1KpCi9BOfviCVhmpI4G2sY"]
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
    zedsDead.bio = "Formed in 2009 in Toronto by producers/DJs Dylan “DC” Mamid and Zachary “Hooks” Rapp-Rovan, Zeds Dead is one of the most successful independent electronic acts of the past decade, counting hundreds of millions of streams, dozens of Top 20 Billboard hits and multiple JUNO Award nominations. \n Zeds Dead have crafted a limitless sound across their expansive discography, which includes multiple breakout singles, remixes and EPs. In 2016, Zeds Dead released their debut album, 'Northern Lights,' which features Diplo, Twin Shadow, Pusha T, Weezer’s Rivers Cuomo and more. A Top 10 hit on Billboard’s Top Dance/Electronic Albums and Heatseekers Albums charts, the album received a nomination for Dance Recording of the Year at the 2017 JUNO Awards. \n In 2016, Zeds Dead launched their tastemaker Deadbeats Records, one of today’s leading independent labels in dance music, with +150 releases from emerging artists like DNMO, PEEKABOO, Subtronics, 1788-L and others. Deadbeats has released a handful of compilations: We Are Deadbeats (Vol. 1 - Vol. 4), which feature original tracks from its wide artist roster, including REZZ, Megalodon and Zeds Dead themselves. \n Zeds Dead and Deadbeats have recently expanded into the live events space via the branded Deadbeats Tour and the annual DeadRocks, a headlining show at Red Rocks Amphitheatre in Denver, which has sold out every year since launching in 2014."
    zedsDead.links = ["https://www.facebook.com/zedsdead", "https://twitter.com/zedsdead", "https://tiktok.com/@zedsdead", "https://www.youtube.com/channel/UCsYkUlicwVBtW-pAInUSyPA", "https://soundcloud.com/zedsdead", "https://open.spotify.com/artist/67qogtRNI0GjUr8PlaG6Zh"]
    zedsDead.isFavorite = false
    zedsDead.isFeatured = true
    
    // ——————————— STAGES ———————————
    let mainStage = Stage(context: context)
    mainStage.name = "Main"
    
    
    // ——————————— DAYS ———————————
    let friday = Day(context: context)
    friday.name = "Friday"
    friday.startTime = dateFrom(year: 2023, month: 9, day: 2, hour: 10, minute: 0, timeZone: timeZone)
    friday.endTime = dateFrom(year: 2023, month: 9, day: 2, hour: 23, minute: 45, timeZone: timeZone)
    
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
