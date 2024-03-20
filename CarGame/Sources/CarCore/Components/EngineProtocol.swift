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
