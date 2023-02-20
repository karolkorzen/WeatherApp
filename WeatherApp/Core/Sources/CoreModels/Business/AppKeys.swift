import Foundation

public struct AppKeys {
    private static var _weatherapiKey: String?
    
    public static var weatherapiKey: String {
        guard let key = _weatherapiKey else { fatalError("App not initialized") }
        return key
    }
    
    public static func setup(config: ExternalServicesConfiguration) {
        self._weatherapiKey = config.weatherapiKey
    }
}
