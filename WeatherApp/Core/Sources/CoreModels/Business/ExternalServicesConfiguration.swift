import Foundation

public struct ExternalServicesConfiguration {
    public let weatherapiKey: String
    
    public init(dto: DTO.ExternalServicesConfiguration) {
        self.weatherapiKey = dto.weatherapiKey
    }
}
