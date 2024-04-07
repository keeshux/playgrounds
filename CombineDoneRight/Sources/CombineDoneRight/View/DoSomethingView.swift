import Combine
import SwiftUI

struct DoSomethingView: View {
    private let viewModel: DoSomethingViewModel

    private let resultPublisher: AnyPublisher<SomeResultState, Never>

    private let isPendingPublisher: AnyPublisher<Bool, Never>

    @State private var someResult: SomeResultState = .void

    @State private var isPending = false

    init(viewModel: DoSomethingViewModel) {
        self.viewModel = viewModel
        resultPublisher = viewModel.resultPublisher
        isPendingPublisher = viewModel.isPendingPublisher
    }

    var body: some View {
        VStack(spacing: 20) {
            Button("Do something") {
                viewModel.doSomethingWith(number: .random(in: 0..<100),
                                          string: "hola")
            }
            .disabled(isPending)
            Text(resultMessage)
        }
        .onReceive(resultPublisher) {
            someResult = $0
        }
        .onReceive(isPendingPublisher) {
            isPending = $0
        }
        .frame(width: 400, height: 150)
        .padding()
    }

    var resultMessage: String {
        guard !isPending else {
            return "...waiting..."
        }
        switch someResult {
        case .success(let result):
            return result

        case .failure(let error):
            return error.localizedDescription

        default:
            return ""
        }
    }
}

#Preview {
    DoSomethingView(viewModel: {
        let useCase = DoSomethingUseCase()
        return ImperativeDoSomethingViewModel(useCase: useCase)
    }())
}
