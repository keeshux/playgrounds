//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import Foundation

public struct Wheel {
    public enum Direction {
        case left

        case right
    }

    public let canSteer: Bool

    public private(set) var speed: Int

    public private(set) var angle: Int

    public init(canSteer: Bool) {
        self.canSteer = canSteer
        speed = 0
        angle = 0
    }

    public mutating func doAccelerate() {
        speed += 10
    }

    public mutating func doBrake(with brake: Brake) {

        // do not go past 0
        speed = max(0, speed - brake.speedVariation)
    }

    public mutating func doSteer(direction: Direction) {
        guard canSteer else {
            return
        }
        switch direction {
        case .left:
            angle -= 10

        case .right:
            angle += 10
        }
    }
}
