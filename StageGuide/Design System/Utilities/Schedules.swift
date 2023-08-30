//
//  Dates.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import Foundation

// Helper function to create a Date instance
func dateFrom(year: Int, month: Int, day: Int, hour: Int, minute: Int, timeZone: String) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.timeZone = TimeZone(identifier: timeZone)
    let calendar = Calendar.current
    return calendar.date(from: components)!
}

// Extract all the available time slots
func extractTimeSlots(lineup: [Act]) -> [String] {
    var timeSlots: [String] = []
    let sortedAct = lineup.sorted { $0.startTime ?? Date() > $1.startTime ?? Date() }
    sortedAct.forEach { act in
        guard !timeSlots.contains(formatToTimeSlot(inputTime: act.startTime ?? Date())) else {
            return
        }
        timeSlots.append(formatToTimeSlot(inputTime: act.startTime ?? Date()))
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
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "ha"
    
    // Set the locale to enforce 12-hour format
    outputFormatter.locale = Locale(identifier: "en_US_POSIX")
    
    return outputFormatter.string(from: inputTime)
}

func extractInitials(lineup: [Act]) -> [String] {
    //        let initial = "\(actName[actName.startIndex])"
    let placeholderName = "Unknown"
    
    var initials: [String] = []
    let sortedAct = lineup.sorted { $0.name ?? "Unknown" < $1.name ?? "Unknown" }
    print("sortedTimeSlots")
    sortedAct.forEach { act in
        let actName = act.name
        guard !initials.contains("\(actName?[actName?.startIndex ?? placeholderName.startIndex] ?? "U")") else {
            return
        }
        initials.append("\(actName?[actName?.startIndex ?? placeholderName.startIndex] ?? "U")")
    }
    
    return initials
}
