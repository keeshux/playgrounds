// The Swift Programming Language
// https://docs.swift.org/swift-book

import MyLibrary

let content = """
{
    "id": 1,
    "name": "One"
}
"""

let isChina = true

let app: MyApp
if isChina {
    app = MyApp(api: ChinaAPI(), jsonContent: content)
} else {
    app = MyApp(api: MockAPI(), jsonContent: content)
}
app.doSomething()
app.printJSON()
app.doSomethingElse()
