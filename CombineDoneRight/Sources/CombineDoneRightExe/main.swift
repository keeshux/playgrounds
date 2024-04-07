import Combine
@testable import CombineDoneRight
import Foundation

let useCase = DoSomethingUseCase()
let vm = BadDoSomethingViewModel(useCase: useCase)

var cancellables: Set<AnyCancellable> = []
vm.resultPublisher
    .sink { state in
        print("State: \(state)")
    }
    .store(in: &cancellables)

for _ in 0..<5 {
    vm.doSomethingWith(number: 10, string: "hello")
    Thread.sleep(forTimeInterval: 0.1)
}

for _ in 0..<5 {
    vm.doSomethingWith(number: 10, string: "hello")
    Thread.sleep(forTimeInterval: 0.1)
}
