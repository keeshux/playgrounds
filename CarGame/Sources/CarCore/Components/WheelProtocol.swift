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

    mutating func doAccelerate(delta: Int)

    mutating func doBrake(with brake: BrakeProtocol, intensity: Int)

    mutating func doSteer(direction: WheelDirection, delta: Int)
}
