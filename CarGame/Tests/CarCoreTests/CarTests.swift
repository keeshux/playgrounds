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
    func testCar() throws {
        var sut = Car()

        sut.start()
        XCTAssertTrue(sut.isStarted)
        try sut.stop()
        XCTAssertFalse(sut.isStarted)

        sut.start()
        try sut.accelerate()
        XCTAssertThrowsError(try sut.stop())
        sut.brake()
        try sut.stop()

        sut.start()
        XCTAssertTrue(sut.isStarted)
        try sut.accelerate()
        XCTAssertEqual(sut.currentSpeed(), 10)
        try sut.accelerate()
        XCTAssertEqual(sut.currentSpeed(), 20)
        try sut.accelerate()
        XCTAssertEqual(sut.currentSpeed(), 30)

        sut.brake()
        XCTAssertEqual(sut.currentSpeed(), 20)
        sut.brake()
        XCTAssertEqual(sut.currentSpeed(), 10)

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
