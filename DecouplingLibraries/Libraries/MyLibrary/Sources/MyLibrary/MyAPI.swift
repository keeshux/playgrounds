//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/4/24.
//

import Foundation

public protocol MyAPI {
    func decode(string: String) -> [String: Any]?
//    func eCommerceName() -> String
    func ordersList() -> [String]
}
