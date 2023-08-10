//
//  PlaceholderAction.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-03.
//

import Foundation
import SwiftUI

func placeholderAction() {
    print("Action triggered")
}

func placeholderAct() -> Act {
    return Act(name: "Dashi",
               shortName: "Dashi",
               startTime: dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 0, timeZone: "America/New_York"),
               endTime: dateFrom(year: 2023, month: 9, day: 8, hour: 19, minute: 0, timeZone: "America/New_York"),
               stage: "Main",
               image: Image("Artists/Dashi"),
               description: "It's About House Music And It Always Has Been",
               isFavourite: false
              )
}
