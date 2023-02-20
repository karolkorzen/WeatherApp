import Foundation

public enum RESTError: Error {
    case wrongStatusResponse(Int, APIError?)
    case noInternetConnection
    case unknown
    case customError(Error)
}

public struct APIError: Decodable {
    public let message: String?
    public let code: Int?
}
