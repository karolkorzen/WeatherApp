import Foundation
import Combine
import CoreModels
import Networking

public protocol LocationsService {
    func searchLocations(input: String) -> AnyPublisher<[Location], RESTError>
}

public final class DefaultLocationsService: LocationsService {
    private let restService: RESTService
    
    public init(
        restService: RESTService
    ) {
        self.restService = restService
    }
    
    public func searchLocations(input: String) -> AnyPublisher<[Location], RESTError> {
        let request = LocationsRESTRequest.searchLocation(input)
        let publisher: AnyPublisher<[DTO.Location], RESTError> = restService.execute(request)
        return publisher
            .map { $0.map(Location.init) }
            .eraseToAnyPublisher()
    }
}
