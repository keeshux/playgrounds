// The Swift Programming Language
// https://docs.swift.org/swift-book

import CarCore
import SimpleCar

var car = Car.simpleCar(brakeSpeedVariation: 10)

car.doAndPrint { _ in
    print("Create car")
}

car.doAndPrint {
    print("Start car")
    $0.start()
}

try car.doAndPrint {
    print("Accelerate")
    try $0.accelerate(delta: 10)
}

try car.doAndPrint {
    print("Accelerate")
    try $0.accelerate(delta: 10)
}

car.doAndPrint {
    print("Steer left")
    $0.steer(direction: .left, delta: 10)
}

car.doAndPrint {
    print("Brake 6 times")
    $0.brake(intensity: 6)
}

try car.doAndPrint {
    print("Stop car")
    try $0.stop()
}
