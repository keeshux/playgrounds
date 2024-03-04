//
//  File.swift
//  
//
//  Created by Davide De Rosa on 3/4/24.
//

import Foundation
import MyLibrary

struct MyApp {
    private let api: MyAPI
    private let jsonContent: String

    init(api: MyAPI, jsonContent: String) {
        self.api = api
        self.jsonContent = jsonContent
//        json = JSON(parseJSON: content)
    }

    func printJSON() {
//        print("JSON: \(json.dictionaryValue)")
        print("JSON: \(api.decode(string: jsonContent))")
    }

    func doSomething() {
        print("Something")
    }

    func doSomethingElse() {
        print("Something Else")
    }
}
