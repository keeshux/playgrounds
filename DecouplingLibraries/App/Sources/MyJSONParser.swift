//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/4/24.
//

import Foundation
import SwiftyJSON

struct MyJSONParser {
    private let json: JSON

    init(content: String) {
        json = JSON(parseJSON: content)
    }

    func printJSON() {
        print("JSON: \(json.dictionaryValue)")
    }
}
