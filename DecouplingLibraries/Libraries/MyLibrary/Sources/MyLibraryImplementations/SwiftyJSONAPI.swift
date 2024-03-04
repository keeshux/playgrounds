//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/4/24.
//

import Foundation
import MyLibrary
import SwiftyJSON

public final class SwiftyJSONAPI: MyAPI {
    public init() {
    }

    public func decode(string: String) -> [String : Any]? {
        JSON(parseJSON: string).dictionaryValue
    }
}
