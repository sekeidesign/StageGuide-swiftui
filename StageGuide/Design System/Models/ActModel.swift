//
//  ActModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-07.
//

import SwiftUI

struct Act {
    var name: String
    var startTime: TimeInterval
    var endTime: TimeInterval
    var stage: String
    var isScheduled: Binding<Bool>
}
