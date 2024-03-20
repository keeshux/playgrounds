//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/17/24.
//

import Foundation

public protocol BrakeProtocol {
    var speedVariation: Int { get }
}

public struct Brake: BrakeProtocol {
    public let speedVariation: Int

    public init(speedVariation: Int) {
        self.speedVariation = speedVariation
    }
}
