//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import CarCore
import Foundation

public struct Engine: EngineProtocol {
    public private(set) var isOn: Bool

    public init() {
        isOn = false
    }

    public mutating func start() {
        isOn = true
    }

    public mutating func stop() {
        isOn = false
    }
}
