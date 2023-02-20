import Foundation

public enum HomeRoute: AppRoutable {
    case searchLocations
    case app(AppRoute)
}

