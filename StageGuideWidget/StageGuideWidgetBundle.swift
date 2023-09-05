//
//  StageGuideWidgetBundle.swift
//  StageGuideWidget
//
//  Created by Piergiorgio Gonni on 2023-09-02.
//

import WidgetKit
import SwiftUI

@main
struct StageGuideWidgetBundle: WidgetBundle {
    var body: some Widget {
        StageGuideWidget()
        StageGuideWidgetLiveActivity()
    }
}
