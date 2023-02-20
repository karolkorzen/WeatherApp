import Foundation
import UIKit
import HomeFeature
import XCoordinator
import Routes
import CommonResources
import CommonUIUtils

final class AppCoordinator: NavigationCoordinator<AppRoute> {
    //MARK: Properties
    private let diContainer: AppDIContainer
    
    //MARK: Lifecycle
    init(
        diContainer: AppDIContainer
    ) {
        self.diContainer = diContainer
        super.init(initialRoute: .splash)
    }
    
    //MARK: Routes/Transitions
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .startApp:
            let diContainer: HomeDIContainer = diContainer.resolve()
            let homeCoordinator: HomeCoordinator = .init(
                rootViewController: rootViewController,
                diContainer: diContainer,
                appRouter: weakRouter
            )
            
            return .addChild(homeCoordinator)
        case .splash:
            let interactor: SplashInteractor = diContainer.resolve(router: weakRouter)
            let vc = SplashViewController(interactor: interactor)
            
            return .set([vc])
        case let .showAlert(title, message, actions):
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            
            if actions.isEmpty {
                alert.addAction(okAction)
            } else {
                actions.forEach { alert.addAction($0) }
            }
            
            return .present(alert)
        case .showErrorAlert(let error):
            let alert = UIAlertController(
                title: L10n.error,
                message: error.localizedDescription,
                preferredStyle: .alert
            )
            alert.addAction(okAction)
            
            return .present(alert)
        }
    }
}

//MARK: - Setup Navigation Bar
private extension AppCoordinator {
    func setupNavigationBar() {
        rootViewController.navigationBar.app(
            tintColor: UIColor.appPrimaryText,
            backgroundColor: UIColor.appBackground
        )
    }
}

//MARK: - Navigation Utils
private extension AppCoordinator {
    var okAction: UIAlertAction {
        UIAlertAction(title: L10n.ok, style: .default)
    }
}
