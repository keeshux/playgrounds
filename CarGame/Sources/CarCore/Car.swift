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
    private static let numberOfWheels = 4

    private static let numberOfFrontWheels = 2

    private let brakeComponent: Brake

    private var engine: Engine

    public private(set) var wheels: [Wheel]

    public init() {
        brakeComponent = Brake(speedVariation: 10)
        engine = Engine()
        wheels = (0..<Self.numberOfWheels)
            .map {
                // only front wheels can steer
                Wheel(canSteer: $0 < Self.numberOfFrontWheels)
            }
    }

    public mutating func start() {
        engine.start()
    }

    public mutating func stop() throws {
        guard !isMoving else {
            throw CarError.carIsMoving
        }
        engine.stop()
    }

    public var isStarted: Bool {
        engine.isOn
    }

    public var isMoving: Bool {
        currentSpeed() != 0
    }

    public var isSteering: Bool {
        currentAngle() != 0
    }

    public func currentSpeed() -> Int {
        let differentSpeeds = Set(wheels
            .map(\.speed)
        )
        guard differentSpeeds.count == 1 else {
            assertionFailure("Wheels have different speeds")
            return 0
        }
        return differentSpeeds.first ?? 0
    }

    public func currentAngle() -> Int {
        let differentAngles = Set(wheels
            .enumerated()
            .filter { $0.offset < Self.numberOfFrontWheels }
            .map(\.element.angle)
        )
        guard differentAngles.count == 1 else {
            assertionFailure("Front wheels have different angles")
            return 0
        }
        return differentAngles.first ?? 0
    }

    public mutating func accelerate(delta: Int) throws {
        guard engine.isOn else {
            throw CarError.carIsStopped
        }
        wheels = wheels.copy {
            $0.doAccelerate(delta: delta)
        }
    }

    public mutating func brake(intensity: Int) {
        wheels = wheels.copy {
            $0.doBrake(with: brakeComponent, intensity: intensity)
        }
    }

    public mutating func steer(direction: Wheel.Direction, delta: Int) {
        wheels = wheels.copy {
            $0.doSteer(direction: direction, delta: delta)
        }
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
        wheels.enumerated().forEach {
            desc.append("\twheel[\($0.offset)] = (speed: \($0.element.speed), angle: \($0.element.angle))")
        }
        return desc.joined(separator: "\n")
    }
}
