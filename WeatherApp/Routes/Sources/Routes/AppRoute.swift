import XCoordinator
import UIKit

public enum AppRoute: AppRoutable {
    case startApp
    case splash
    case showAlert(title: String, message: String, actions: [UIAlertAction])
    case showErrorAlert(Error)
    
    public static func app(_ route: AppRoute) -> Self { route }
}

protocol AppRoutable: Route {
    static func app(_: AppRoute) -> Self
}
