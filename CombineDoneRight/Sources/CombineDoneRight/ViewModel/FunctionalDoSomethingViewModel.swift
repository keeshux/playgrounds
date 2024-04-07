import Combine
import Foundation

// this is thread-safe because it's stateless
// useCaseInput is thread-safe and may be called from any thread
//
// the thread choice is left to the final receiver (the view)
// by using the .receive(on:) Combine notation
//
// no ugly .sink() here!

final class FunctionalDoSomethingViewModel: DoSomethingViewModel {
    private let useCase: DoSomethingUseCaseProtocol

    private let useCaseInput: PassthroughSubject<DoSomethingUseCaseInput, Never>

    private let isPendingSubject: PassthroughSubject<Bool, Never>

    private var cancellables: Set<AnyCancellable>

    init(useCase: DoSomethingUseCaseProtocol) {
        self.useCase = useCase
        useCaseInput = PassthroughSubject()
        isPendingSubject = PassthroughSubject()
        cancellables = []
    }

    func doSomethingWith(number: Int, string: String) {
        useCaseInput.send(.init(number: number, string: string))
    }

    var resultPublisher: AnyPublisher<SomeResultState, Never> {
        useCaseInput
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.isPendingSubject.send(true)
            })
            .flatMap { input in
                self.useCase.execute(with: input)
            }
            .map { output in
                .success(result: output.result)
            }
            .catch { error in
                Just(.failure(error: error))
            }
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.isPendingSubject.send(false)
            })
            .eraseToAnyPublisher()
    }

    var isPendingPublisher: AnyPublisher<Bool, Never> {
        isPendingSubject.eraseToAnyPublisher()
    }
}
