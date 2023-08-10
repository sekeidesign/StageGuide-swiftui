//
//  Dates.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import Foundation

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
        
        return inputTime.formatted(date: .omitted, time: .shortened) // Return original input if formatting fails
    }
