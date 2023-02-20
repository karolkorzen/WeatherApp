import Foundation

public extension DTO {
    struct Location: Decodable {
        let name: String
        let country: String
    }
}
