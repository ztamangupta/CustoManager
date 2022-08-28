//
//  DefaultAnimation.swift
//  CustoManager
//
//  Created by Aman Gupta on 27/08/22.
//

import Foundation
import SwiftUI

public class DefaultAnimation {

    /// Default animation duration.
    public static var defaultDuration = 0.2

    /// Default ease in / out animation with the default duration.
    public static func defaultAnimation(duration: Double = defaultDuration) -> Animation {
        Animation.easeInOut(duration: duration)
    }
}

/// A default ease in / out animation with the default duration.
public func withDefaultAnimation<Result>(duration: Double = DefaultAnimation.defaultDuration, _ body: () throws -> Result) rethrows -> Result {
    try withAnimation(DefaultAnimation.defaultAnimation(duration: duration), body)
}
