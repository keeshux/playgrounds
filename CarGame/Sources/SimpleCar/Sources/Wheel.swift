//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import CarCore
import Foundation

public struct Wheel: WheelProtocol {
    public let canSteer: Bool

    public private(set) var speed: Int

    public private(set) var angle: Int

    public init(canSteer: Bool) {
        self.canSteer = canSteer
        speed = 0
        angle = 0
    }

    public mutating func doAccelerate(delta: Int) {
        speed += delta
    }

    public mutating func doBrake(with brake: BrakeProtocol, intensity: Int) {

        // do not go past 0
        speed = max(0, speed - intensity * brake.speedVariation)
    }

    public mutating func doSteer(direction: WheelDirection, delta: Int) {
        guard canSteer else {
            return
        }
        switch direction {
        case .left:
            angle -= abs(delta)

        case .right:
            angle += abs(delta)
        }
    }
}
