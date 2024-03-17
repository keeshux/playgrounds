//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/17/24.
//

import Foundation

enum CarError: Error {
    case carIsStopped

    case carIsMoving
}

public struct Car {
    public enum Direction {
        case left

        case right
    }

    public private(set) var isStarted = false

    public private(set) var speed = 0

    public private(set) var angle = 0

    public init() {
    }

    public mutating func start() {
        isStarted = true
    }

    public mutating func stop() throws {
        guard !isMoving else {
            throw CarError.carIsMoving
        }
        isStarted = false
    }

    public var isMoving: Bool {
        speed != 0
    }

    public var isSteering: Bool {
        angle != 0
    }

    public func currentSpeed() -> Int {
        speed
    }

    public func currentAngle() -> Int {
        angle
    }

    public mutating func accelerate() throws {
        guard isStarted else {
            throw CarError.carIsStopped
        }
        speed += 10
    }

    public mutating func brake() {
        speed = max(0, speed - 10)
    }

    public mutating func steer(direction: Direction) {
        let delta: Int
        switch direction {
        case .left:
            delta = -10

        case .right:
            delta = 10
        }
        angle += delta
    }
}

extension Car: CustomStringConvertible {
    public var description: String {
        var desc: [String] = []
        desc.append("Car")
        desc.append("\tisStarted = \(isStarted)")
        desc.append("\tisMoving = \(isMoving)")
        desc.append("\tcurrentSpeed = \(currentSpeed())")
        desc.append("\tcurrentAngle = \(currentAngle())")
        return desc.joined(separator: "\n")
    }
}
