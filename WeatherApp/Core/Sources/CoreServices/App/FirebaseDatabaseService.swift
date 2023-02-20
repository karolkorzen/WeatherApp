import Foundation
import Combine
import CoreModels
import FirebaseDatabase

public protocol FirebaseDatabaseService {
    func getExternalServicesConfiguration() -> AnyPublisher<ExternalServicesConfiguration, Error>
}

public final class DefaultFirebaseDatabaseService: FirebaseDatabaseService {
    private let firebaseDatabase: Database

    public init(
        firebaseDatabase: Database = Database.database()
    ) {
        self.firebaseDatabase = firebaseDatabase
    }

    public func getExternalServicesConfiguration() -> AnyPublisher<ExternalServicesConfiguration, Error> {
        Future { [unowned self] promise in
            firebaseDatabase.reference().child("ios").getData(completion: { error, snapshot in
                guard
                    let value = snapshot?.value as? [String: String],
                    error == nil
                else {
                    promise(.failure(error ?? UnknownError.init()))
                    return
                }

                do {
                    let json = try JSONSerialization.data(withJSONObject: value)
                    let decoder = JSONDecoder()
                    let externalServicesConfigurationDTO = try decoder.decode(DTO.ExternalServicesConfiguration.self, from: json)
                    let externalServicesConfiguration = ExternalServicesConfiguration(dto: externalServicesConfigurationDTO)
                    promise(.success(externalServicesConfiguration))
                } catch {
                    promise(.failure(error))
                }
            })
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

private struct UnknownError: LocalizedError {
    public init() { }
}
