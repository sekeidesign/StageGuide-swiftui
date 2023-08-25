//
//  CurrentDateChecker.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-25.
//

import Foundation
import SwiftUI

private struct FestivalStatus: EnvironmentKey {
  static let defaultValue = false
}

extension EnvironmentValues {
  var isFestivalLive: Bool {
    get { self[FestivalStatus.self] }
    set { self[FestivalStatus.self] = newValue }
  }
}
