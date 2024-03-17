// The Swift Programming Language
// https://docs.swift.org/swift-book

import CarCore

var car = Car()

car.doAndPrint { _ in
    print("Create car")
}

car.doAndPrint {
    print("Start car")
    $0.start()
}

try car.doAndPrint {
    print("Accelerate")
    try $0.accelerate()
}

try car.doAndPrint {
    print("Accelerate")
    try $0.accelerate()
}

car.doAndPrint {
    print("Steer left")
    $0.steer(direction: .left)
}

car.doAndPrint {
    print("Brake 6 times")
    for _ in 0..<6 {
        $0.brake()
    }
}

try car.doAndPrint {
    print("Stop car")
    try $0.stop()
}
