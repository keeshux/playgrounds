//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/17/24.
//

import CarCore
import Foundation
import XCTest

final class CarTests: XCTestCase {
    func test_givenStoppedCar_whenStart_thenIsStarted() {
        var sut = Car()
        sut.start()
        XCTAssertTrue(sut.isStarted)
    }

    func test_givenStoppedCar_whenStop_thenIsStopped() throws {
        var sut = Car()
        sut.start()
        XCTAssertTrue(sut.isStarted)
        try sut.stop()
        XCTAssertFalse(sut.isStarted)
    }

    func test_givenMovingCar_whenStop_thenFails() throws {
        var sut = Car()
        sut.start()
        try sut.accelerate()
        XCTAssertThrowsError(try sut.stop())
    }

    func test_givenStartedCar_whenAccelerate_thenSpeedIncreases() throws {
        var sut = Car()
        sut.start()
        XCTAssertTrue(sut.isStarted) // out of scope

        try sut.accelerate()
        XCTAssertEqual(sut.currentSpeed(), 10)
        try sut.accelerate()
        XCTAssertEqual(sut.currentSpeed(), 20)
    }

    func test_givenStartedCar_whenBrake_thenSpeedDecreases() throws {
        var sut = Car()
        sut.start()
        XCTAssertTrue(sut.isStarted) // out of scope

        try sut.accelerate()
        try sut.accelerate()
        try sut.accelerate()
        XCTAssertEqual(sut.currentSpeed(), 30) // out of scope

        sut.brake()
        XCTAssertEqual(sut.currentSpeed(), 20)
        sut.brake()
        XCTAssertEqual(sut.currentSpeed(), 10)
    }

    func test_givenStoppedCar_whenAccelerate_thenFails() throws {
        var sut = Car()
        XCTAssertThrowsError(try sut.accelerate())
    }

    func test_givenCar_whenSteer_thenAngleIsAltered() throws {
        var sut = Car()

        sut.steer(direction: .left)
        XCTAssertTrue(sut.isSteering)
        XCTAssertEqual(sut.currentAngle(), -10)

        sut.steer(direction: .left)
        XCTAssertTrue(sut.isSteering)
        XCTAssertEqual(sut.currentAngle(), -20)

        sut.steer(direction: .right)
        XCTAssertTrue(sut.isSteering)
        XCTAssertEqual(sut.currentAngle(), -10)

        sut.steer(direction: .right)
        XCTAssertFalse(sut.isSteering)
        XCTAssertEqual(sut.currentAngle(), 0)
    }
}