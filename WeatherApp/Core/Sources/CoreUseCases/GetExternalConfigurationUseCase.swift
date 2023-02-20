import Foundation
import Combine
import CoreModels
import CoreServices

public protocol GetExternalConfigurationUseCase {
    func execute() -> AnyPublisher<Void, Error>
}

public final class DefaultGetExternalConfigurationUseCase: GetExternalConfigurationUseCase {
    public let firebaseService: FirebaseDatabaseService
    
    public init(firebaseService: FirebaseDatabaseService) {
        self.firebaseService = firebaseService
    }
    
    public func execute() -> AnyPublisher<Void, Error> {
        firebaseService.getExternalServicesConfiguration()
            .handleEvents(receiveOutput: { AppKeys.setup(config: $0) })
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
