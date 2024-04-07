import Combine
import Foundation

final class SessionManager {
    static let shared = SessionManager()

    private let isLoggedSubject: CurrentValueSubject<Bool, Never>

    var isLogged: Bool {
        isLoggedSubject.value
    }

    var isLoggedPublisher: AnyPublisher<Bool, Never> {
        isLoggedSubject.eraseToAnyPublisher()
    }

    private init() {
        isLoggedSubject = CurrentValueSubject(false)
    }

    func logIn() {
        isLoggedSubject.send(true)
    }

    func logOut() {
        isLoggedSubject.send(false)
    }
}
