//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/4/24.
//

import Foundation
import MyLibrary

final class ChinaAPI: MyAPI {
    func decode(string: String) -> [String : Any]? {
        fatalError("JSON decoding is not supported in China")
    }
}
