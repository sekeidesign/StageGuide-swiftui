//
//  LiveActivityRefresh.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-09-02.
//

import Foundation
import BackgroundTasks

func liveActivityRefresh(nextRefresh: Date) {
    let request = BGAppRefreshTaskRequest(identifier: "ca.sekei.StageGuide.liveActivityRefresh")
    request.earliestBeginDate = nextRefresh
    do {
        try BGTaskScheduler.shared.submit(request)
        print("Activity scheduled")
    } catch {
        print("Error scheduling background task: \(error.localizedDescription)")
    }
}
