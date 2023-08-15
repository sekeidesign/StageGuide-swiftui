//
//  Dates.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import Foundation

// Extract all the available time slots
func extractTimeSlots(lineup: [Act]) -> [String] {
    var timeSlots: [String] = []
    let sortedAct = lineup.sorted { $0.startTime < $1.startTime }
    sortedAct.forEach { act in
        guard !timeSlots.contains(formatToTimeSlot(inputTime: act.startTime)) else {
            return
        }
        timeSlots.append(formatToTimeSlot(inputTime: act.startTime))
    }
    return timeSlots
}

func formatTime(date: Date, timeZone: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mma"
    dateFormatter.timeZone = TimeZone(identifier: timeZone)
    
    return dateFormatter.string(from: date)
}

func formatTimeRange(startTime: Date, endTime: Date, timeZone: String) -> String {
    return "\(formatTime(date: startTime, timeZone: timeZone))-\(formatTime(date: endTime, timeZone: timeZone))"
}

func formatToTimeSlot(inputTime: Date) -> String {
        let formattedTime = inputTime.formatted(date: .omitted, time: .shortened)
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "h:mm a"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "ha"
        
        if let date = inputFormatter.date(from: formattedTime) {
            return outputFormatter.string(from: date)
        }
        
        return inputTime.formatted(date: .omitted, time: .shortened)
    }

func extractInitials(lineup: [Act]) -> [String] {
//        let initial = "\(actName[actName.startIndex])"
    
        var initials: [String] = []
        let sortedAct = lineup.sorted { $0.name < $1.name }
        print("sortedTimeSlots")
        sortedAct.forEach { act in
            let actName = act.name
            guard !initials.contains("\(actName[actName.startIndex])") else {
                return
            }
            initials.append("\(actName[actName.startIndex])")
        }
        
        return initials
    }
