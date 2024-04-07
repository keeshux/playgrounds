import Combine
import Foundation

protocol DoSomethingUseCaseProtocol {
    func execute(with params: DoSomethingUseCaseInput) -> AnyPublisher<DoSomethingUseCaseOutput, Error>
}

struct DoSomethingUseCase: DoSomethingUseCaseProtocol {
    public func execute(with params: DoSomethingUseCaseInput) -> AnyPublisher<DoSomethingUseCaseOutput, Error> {

        // map from Just() to ALWAYS do the processing inside the Combine chain
        // you never know what thread is invoking execute()
        // the use case must be stateless, output must only depend on input
        // additionally, it's the way to leverage Combine operators (like .delay here)
        Just(())
            .delay(for: 1.0, scheduler: DispatchQueue.global())
            .map {
                let result = "\(params.number) | \(params.string)" // business logic
                return DoSomethingUseCaseOutput(result: result)
            }
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct DoSomethingUseCaseInput: Equatable {
    let number: Int
    let string: String
}

struct DoSomethingUseCaseOutput {
    let result: String
}
