import Foundation

public struct Location {
    public let name: String
    public let country: String
    
    public init(_ dto: DTO.Location) {
        self.name = dto.name
        self.country = dto.country
    }
}
