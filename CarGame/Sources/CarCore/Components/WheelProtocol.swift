//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import Foundation

public enum WheelDirection {
    case left

    case right
}

public protocol WheelProtocol {
    var canSteer: Bool { get }

    var speed: Int { get }

    var angle: Int { get }

    /// - Postcondition: `speed` is increased by `delta`
    ///
    mutating func doAccelerate(delta: Int)

    /// - Postcondition: `speed` is decreased by `intensity * brake.speedVariation`
    ///
    mutating func doBrake(with brake: BrakeProtocol, intensity: Int)

    /// - Postcondition: If `!canSteer`, `angle` is not altered.
    /// - Postcondition: If `direction == .left`, `angle` is decreased by absolute `delta`.
    /// - Postcondition: If `direction == .right`, `angle` is increased by absolute `delta`.
    ///
    mutating func doSteer(direction: WheelDirection, delta: Int)
}
