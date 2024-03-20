//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import Foundation

extension Car {
    public init(brakeSpeedVariation: Int) {
        self.init(
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
