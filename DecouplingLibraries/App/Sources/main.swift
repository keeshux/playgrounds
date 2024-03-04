// The Swift Programming Language
// https://docs.swift.org/swift-book

let content = """
{
    "id": 1,
    "name": "One"
}
"""

MyJSONParser(content: content)
    .printJSON()
