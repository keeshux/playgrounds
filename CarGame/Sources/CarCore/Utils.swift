//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/17/24.
//

import Foundation

extension Car {
    public mutating func doAndPrint(_ block: (inout Car) throws -> Void) rethrows {
        try block(&self)
        print(self)
        print()
    }
}

extension Collection {
    public func copy(_ block: (inout Element) -> Void) -> [Element] {
        map {
            var copy = $0
            block(&copy)
            return copy
        }
    }
}
