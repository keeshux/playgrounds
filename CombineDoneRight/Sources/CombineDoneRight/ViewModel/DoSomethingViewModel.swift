import Combine
import Foundation

enum SomeResultState {
    case void
    case loading
    case success(result: String)
    case failure(error: Error)
}

protocol DoSomethingViewModel {
    var resultPublisher: AnyPublisher<SomeResultState, Never> { get }
    var isPendingPublisher: AnyPublisher<Bool, Never> { get }

    func doSomethingWith(number: Int, string: String)
}
