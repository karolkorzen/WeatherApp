import Foundation
import XCoordinator
import UIKit
import Routes

public final class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    //MARK: - Properties
    private let diContainer: HomeDIContainer
    private let appRouter: WeakRouter<AppRoute>
    
    //MARK: - Lifecycle
    public init(
        rootViewController: UINavigationController,
        diContainer: HomeDIContainer,
        appRouter: WeakRouter<AppRoute>
    ) {
        self.diContainer = diContainer
        self.appRouter = appRouter
        super.init(
            rootViewController: rootViewController,
            initialRoute: .searchLocations
        )
    }
    
    //MARK: - Routes/Transitions
    public override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
        case .searchLocations:
            let interactor: SearchLocationsInteractor = diContainer.resolve(router: weakRouter)
            let vc = SearchLocationsViewController(interactor: interactor)
            return .set([vc])
        case .app(let appRoute):
            return .trigger(appRoute, on: appRouter)
        }
    }
    
}
