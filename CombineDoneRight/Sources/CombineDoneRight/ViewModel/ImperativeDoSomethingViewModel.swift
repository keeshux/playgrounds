import Combine
import Foundation

// this is NOT thread-safe because it's stateful
// resultSubject may be modified from multiple threads
//
// the .sink() is unsafe and breaks the Combine chain
// only the final receiver (the view) should .sink() to
// observe the chain output (the use case result)

final class ImperativeDoSomethingViewModel: DoSomethingViewModel {
    private let useCase: DoSomethingUseCaseProtocol

    @Published private var resultSubject: SomeResultState = .void

    private var cancellables: Set<AnyCancellable>

    init(useCase: DoSomethingUseCaseProtocol) {
        self.useCase = useCase
        cancellables = []
    }

    func doSomethingWith(number: Int, string: String) {
        resultSubject = .loading
        useCase.execute(with: .init(number: number, string: string))
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break

                case .failure(let error):
                    self?.resultSubject = .failure(error: error)
                }
            }, receiveValue: { [weak self] output in
                self?.resultSubject = .success(result: output.result)
            })
            .store(in: &cancellables)
    }

    var resultPublisher: AnyPublisher<SomeResultState, Never> {
        $resultSubject.eraseToAnyPublisher()
    }

    var isPendingPublisher: AnyPublisher<Bool, Never> {
        resultPublisher
            .map {
                guard case .loading = $0 else {
                    return false
                }
                return true
            }
            .eraseToAnyPublisher()
    }
}
