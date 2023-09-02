//
//  LiveScheduleAttributes.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-09-02.
//

import Foundation
import ActivityKit

struct LiveScheduleAttributes: ActivityAttributes {
    public typealias LiveScheduleState = ContentState
    
    public struct ContentState: Codable, Hashable {
        var currentAct: String
        var currentActStartTime: Date
        
        var nextAct: String
        var nextActStartTime: Date
    }
    
    var festivalName: String
    var totalDays: Int
    var todayCount: Int
    
}

//festivalName
//totalDays
//todayCount
//
//currentAct
//currentActStartTime
//nextAct
//nextActStartTime
