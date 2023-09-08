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
        
//        init(from decoder: Decoder) throws {
//                do {
//                    let container = try decoder.container(keyedBy: CodingKeys.self)
//                    
//                    let actName = try container.decode(String.self, forKey: .currentAct)
//                    currentAct = actName
//                    
//                    let epochCurrentActStartTime = try container.decode(Double.self, forKey: .currentActStartTime)
//                    currentActStartTime = Date(timeIntervalSince1970: epochCurrentActStartTime)
//                    
//                    let nextActName = try container.decode(String.self, forKey: .nextAct)
//                    nextAct = nextActName
//                    
//                    let epochNextActStartTime = try container.decode(Double.self, forKey: .nextActStartTime)
//                    nextActStartTime = Date(timeIntervalSince1970: epochNextActStartTime)
//                    
//                } catch {
//                    throw error
//                }
//            }
        
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
