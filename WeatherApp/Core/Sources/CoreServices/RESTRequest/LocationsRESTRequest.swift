import Foundation
import CoreModels
import Networking

enum LocationsRESTRequest: RESTRequest {
    case searchLocation(String)
    
    var endpoint: String {
        switch self {
        case .searchLocation:
            return "/v1/search.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchLocation:
            return .get
        }
    }
    
    var queryParams: [String : String] {
        switch self {
        case .searchLocation(let input):
            return ["q" : input]
        }
    }
    
    var apiKey: String {
        AppKeys.weatherapiKey
    }
}
