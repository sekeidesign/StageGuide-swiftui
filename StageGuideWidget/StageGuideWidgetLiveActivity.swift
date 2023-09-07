//
//  StageGuideWidgetLiveActivity.swift
//  StageGuideWidget
//
//  Created by Piergiorgio Gonni on 2023-09-02.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct StageGuideWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveScheduleAttributes.self) { context in
//            var progressInterval: ClosedRange<Date> {
//                let start = Date()
//                let end = context.state.nextActStartTime
//                return start...end
//            }
            VStack(spacing: 0) {
                HStack {
                    HStack(spacing: 4) {
                        Text(context.attributes.festivalName)
                        Text("•")
                        Text("Day \(context.attributes.todayCount)/\(context.attributes.totalDays)")
                    }
                    .foregroundColor(Color(uiColor: .lightGray))
                    Spacer()
                    Text("StageGuide")
                        .foregroundColor(Color(uiColor: .darkGray))
                }
                .font(.caption2)
                .fontWeight(.semibold)
                .padding(.trailing, 16)
                .padding(.vertical, 12)
                Rectangle()
                    .fill(Color(uiColor: .darkGray).opacity(0.5))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Now")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(uiColor: .lightGray))
                            Text("\(context.state.currentAct)")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 4) {
//                            Text(context.state.nextActStartTime, style: .timer)
                            Text(context.state.nextAct)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.85, green: 0.98, blue: 0.31))
                                .multilineTextAlignment(.trailing)
                            Text("\(context.state.nextAct)")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                        }
                    }
//                    ProgressView(timerInterval: progressInterval, countsDown: false, label: {}, currentValueLabel: {})
//                        .progressViewStyle(WithBackgroundProgressViewStyle())
                }
                .padding(.trailing, 16)
                .padding(.vertical, 12)
            }
            .padding(.leading, 16)
            .activityBackgroundTint(.black.opacity(0.7))
            .activitySystemActionForegroundColor(Color(red: 0.85, green: 0.98, blue: 0.31))
            
        } dynamicIsland: { context in
//            var progressInterval: ClosedRange<Date> {
//                let start = context.state.currentActStartTime
//                let end = context.state.nextActStartTime
//                return start...end
//            }
            
            return DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    HStack(spacing: 8) {
                        Text(context.attributes.festivalName)
                        Text("Day \(context.attributes.todayCount)/\(context.attributes.totalDays)")
                            .foregroundColor(Color(uiColor: .darkGray))
                    }
                    .foregroundColor(Color(uiColor: .lightGray))
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.top, 2)
                    .padding(.leading, 4)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("StageGuide")
                        .foregroundColor(Color(uiColor: .darkGray))
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .padding(.top, 2)
                        .padding(.trailing, 4)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Now")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(uiColor: .lightGray))
                                Text("\(context.state.currentAct)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                            }
                            Spacer()
                            VStack(alignment: .trailing, spacing: 4) {
//                                Text(context.state.nextActStartTime, style: .timer)
                                Text(context.state.nextAct)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.85, green: 0.98, blue: 0.31))
                                    .multilineTextAlignment(.trailing)
                                Text("\(context.state.nextAct)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                            }
                        }
//                        ProgressView(timerInterval: progressInterval, countsDown: false, label: {}, currentValueLabel: {})
//                            .progressViewStyle(WithBackgroundProgressViewStyle())
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
                }
            } compactLeading: {
                Text("\(context.state.nextAct)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.85, green: 0.98, blue: 0.31))
            } compactTrailing: {
//                Text(context.state.nextActStartTime, style: .timer)
                Text(context.state.nextAct)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.85, green: 0.98, blue: 0.31))
                    .frame(maxWidth: 40)
                    .multilineTextAlignment(.trailing)
            } minimal: {
                Text("\(context.attributes.todayCount)/\(context.attributes.totalDays)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.85, green: 0.98, blue: 0.31))
                    .frame(width: 48)
            }
        }
    }
}

struct StageGuideWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = LiveScheduleAttributes(festivalName: "Riverside", totalDays: 3, todayCount: 1)
//    static let contentState = LiveScheduleAttributes.ContentState(currentAct: "Bundarr", currentActStartTime: dateFrom(year: 2023, month: 9, day: 2, hour: 9, minute: 0, timeZone: "America/New_York"), nextAct: "Tchami", nextActStartTime: Date().addingTimeInterval(45 * 60))
    static let contentState = LiveScheduleAttributes.ContentState(currentAct: "Bundarr", nextAct: "Tchami")
    
    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}

struct WithBackgroundProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .tint(Color(red: 0.85, green: 0.98, blue: 0.31))
    }
}

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
