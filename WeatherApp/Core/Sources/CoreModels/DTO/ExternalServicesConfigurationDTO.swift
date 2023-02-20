import Foundation

public extension DTO {
    struct ExternalServicesConfiguration: Decodable {
        enum CodingKeys: String, CodingKey {
            case weatherapiKey = "weatherapi_key"
        }

        public let weatherapiKey: String
    }
}
