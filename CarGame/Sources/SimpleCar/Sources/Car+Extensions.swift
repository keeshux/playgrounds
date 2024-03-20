//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import CarCore
import Foundation

extension Car {
    public static func simpleCar(brakeSpeedVariation: Int) -> Car {
        Car(
            brake: Brake(speedVariation: brakeSpeedVariation),
            engine: Engine(),
            wheels: [
                Wheel(canSteer: true),
                Wheel(canSteer: true),
                Wheel(canSteer: false),
                Wheel(canSteer: false)
            ]
        )
    }
}
