//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/4/24.
//

import Foundation
import MyLibrary

public final class MockAPI: MyAPI {
    public init() {
    }

    public func decode(string: String) -> [String : Any]? {
        [:]
    }
}
