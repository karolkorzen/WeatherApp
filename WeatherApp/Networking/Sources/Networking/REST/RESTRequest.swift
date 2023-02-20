import Foundation
import Config

public protocol RESTRequest {
    var scheme: String { get }
    var basePath: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var queryParams: [String: String] { get }
    var apiKey: String { get }
}

public extension RESTRequest {
    var basePath: String {
        AppConfig.current.host
    }
    
    var scheme: String {
        AppConfig.current.scheme
    }
}

extension RESTRequest {
    var urlRequest: URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = basePath
        components.path = endpoint
        
        #warning("Refactor")
        components.queryItems = [URLQueryItem(name: "key", value: apiKey)]
        components.queryItems?
            .append(contentsOf: queryParams.compactMap { URLQueryItem(name: $0, value: $1) })

        guard let url = components.url else {
            fatalError("Cannot create URL from provided data")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
