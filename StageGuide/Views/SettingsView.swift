//
//  SettingsView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-24.
//

import SwiftUI
import WrappingHStack
import ActivityKit

struct SettingsView: View {
//    @AppStorage("AreNotificationsEnabled") private var areNotificationsEnabled: Bool = UserDefaults.standard.bool(forKey: "AreNotificationsEnabled")
//    @AppStorage("AreLiveActivitiesEnabled") private var areLiveActivitiesEnabled: Bool
//    @AppStorage("NotificationTiming") private var notificationTiming: Int = UserDefaults.standard.integer(forKey: "NotificationTiming")
    @AppStorage("ActiveAppIcon") private var activeAppIcon: String = (UserDefaults.standard.string(forKey: "ActiveAppIcon") ?? "OG")
    
    private let persistenceController = PersistenceController.shared
    let availableAppIcons = [
        "Riverside",
        "OG"
    ]
    
    var body: some View {
        NavigationStack{
            VStack {
                SurveyCard()
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                List {
//                    Section(header: Text("Notifications")) {
//                        HStack{
//                            VStack(alignment: .leading) {
//                                Text("Toggle Notifications")
//                                Text("Get alerts before scheduled sets")
//                                    .font(.subheadline)
//                                    .foregroundStyle(Color(uiColor: .secondaryLabel))
//                            }
//                            Spacer()
//                            Toggle("Toggle Notifications", isOn: $areNotificationsEnabled)
//                                .labelsHidden()
//                        }
//                        NavigationLink {
//                            NotificationTimingView(notificationTiming: notificationTiming)
//                        } label: {
//                            HStack{
//                                VStack(alignment: .leading) {
//                                    Text("Notification timing")
//                                    Text("When to receive notifications")
//                                        .font(.subheadline)
//                                        .foregroundColor(Color(uiColor: .secondaryLabel))
//                                }
//                                Spacer()
//                                Text("\(notificationTiming)min")
//                                    .foregroundColor(Color(uiColor: .tertiaryLabel))
//                            }
//                        }
//                    }
                    
//                    Section(header: Text("Live Activities")) {
//                        Button {
//                            if let bundle = Bundle.main.bundleIdentifier,
//                                let settings = URL(string: UIApplication.openNotificationSettingsURLString + bundle) {
//                                if UIApplication.shared.canOpenURL(settings) {
//                                    UIApplication.shared.open(settings)
//                                }
//                            }
//                        } label: {
//                            HStack{
//                                VStack(alignment: .leading) {
//                                    Text("Allow notifications")
//                                        .foregroundColor(.white)
//                                    Text("Notifications are required for the live activity")
//                                        .font(.subheadline)
//                                        .foregroundStyle(Color(uiColor: .secondaryLabel))
//                                }
//                                Spacer()
//                                Image(systemName: "chevron.right")
//                            }
//                        }
//                        Button {
//                            if let bundle = Bundle.main.bundleIdentifier,
//                                let settings = URL(string: UIApplication.openSettingsURLString + bundle) {
//                                if UIApplication.shared.canOpenURL(settings) {
//                                    UIApplication.shared.open(settings)
//                                }
//                            }
//                        } label: {
//                            HStack{
//                                VStack(alignment: .leading) {
//                                    Text("Show Live Activity")
//                                        .foregroundColor(.white)
//                                    Text("Live timeline on your lock screen")
//                                        .font(.subheadline)
//                                        .foregroundStyle(Color(uiColor: .secondaryLabel))
//                                }
//                                Spacer()
//                                Image(systemName: "chevron.right")
//                            }
//                        }
//                    }
                    Section(header: Text("App icon")) {
                        WrappingHStack(availableAppIcons, id: \.self, spacing: .constant(16), lineSpacing: 16) {
                            SGAppIconButton(image: Image("App Icons/\($0)"), iconName: $0, isActive: $0 == activeAppIcon)
                        }
                        .padding(.vertical, 8)
                    }
                    
#if DEBUG
                    Button {
                        persistenceController.deleteAllData()
                    } label: {
                        Text("Reset data")
                            .foregroundColor(.red)
                    }
                    
#endif
                }
                .frame( maxWidth: .infinity)
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .onAppear {
                UserDefaults.standard.set(true, forKey: "HasOpenedSettings")
            }
        }
    }
}

struct SurveyCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Text("StageGuide")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                Text("(Riverside Beta 0.0.1)")
                    .foregroundColor(Color(uiColor: .tertiaryLabel))
            }
            .font(.caption)
            .fontWeight(.bold)
            HStack(spacing: 4) {
                Text("Help us make music festivals better for everyone! Your feedback means the world to us, tell us what you loved and what you hated!")
            }
            .font(.subheadline)
            .foregroundColor(Color(uiColor: .label))
            HStack {
                Text("Thank you")
                    .font(.caption2)
                    .foregroundColor(Color(uiColor: .tertiaryLabel))
                Spacer()
                SGPillButton(symbol: Image(systemName: "arrow.right.doc.on.clipboard"), label: Text("Give feedback"), link: "https://docs.google.com/forms/d/e/1FAIpQLSeWm6FYWqX0h3ytNpA93ye0CnSiYrTq0OHjhPdhoRBBecPQtg/viewform?usp=sf_link", linkFromDomain: false)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(uiColor: .tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(LinearGradient(
            stops: [
                Gradient.Stop(color: .white.opacity(0.5), location: 0.00),
                Gradient.Stop(color: .white.opacity(0), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.25, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
        )))
    }
}

struct NotificationTimingView: View {
    let notificationTiming: Int
    var body: some View {
        NavigationStack {
            List {
                ForEach([0, 5, 10, 15], id: \.self) { timing in
                    Button {
                        UserDefaults.standard.set(timing, forKey: "NotificationTiming")
                    } label: {
                        HStack {
                            Text(timing == 0 ? "Start of the set" : "\(timing) minutes before")
                                .foregroundColor(Color(uiColor: .label))
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                                .isHidden(notificationTiming != timing)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                }
            }
            Spacer()
        }
        .navigationBarTitle("Notification Timing", displayMode: .inline)
    }
}

//#Preview {
//    SettingsView()
//}
