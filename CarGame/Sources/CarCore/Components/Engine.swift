//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/20/24.
//

import Foundation

public protocol EngineProtocol {
    var isOn: Bool { get }

    mutating func start()

    mutating func stop()
}

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
