import Foundation
import Combine
import CoreModels
import Networking
import CoreServices

public protocol SearchLocationsUseCase {
    func execute(input: String) -> AnyPublisher<[Location], RESTError>
}

public final class DefaultSearchLocationsUseCase: SearchLocationsUseCase {
    private let locationsService: LocationsService
    
    public init(locationsService: LocationsService) {
        self.locationsService = locationsService
    }
    
    public func execute(input: String) -> AnyPublisher<[Location], RESTError> {
        locationsService.searchLocations(input: input)
    }
}
