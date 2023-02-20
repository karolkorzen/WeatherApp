import Foundation
import HomeFeature
import Networking
import XCoordinator
import Routes
import CoreUseCases
import CoreServices

//MARK: - AppDIContainer
public protocol AppDIContainer {
    func resolve() -> HomeDIContainer
    func resolve(router: WeakRouter<AppRoute>) -> SplashInteractor
}

//MARK: - DefaultAppDIContainer
public final class DefaultAppDIContainer: AppDIContainer {
    // MARK: Shared instances
    private lazy var urlSession: URLSession = .shared
}

//MARK: - Dependency Injection Containers
extension DefaultAppDIContainer {
    public func resolve() -> HomeDIContainer {
        DefaultHomeDIContainer(
            dependencies: .init(
                resolveRESTService: { [unowned self] in resolve() }
            )
        )
    }
}

// MARK: - Interactors
extension DefaultAppDIContainer {
    public func resolve(router: WeakRouter<AppRoute>) -> SplashInteractor {
        DefaultSplashInteractor(
            router: router,
            getExternalConfigurationUseCase: resolve()
        )
    }
}

// MARK: - UseCases
private extension DefaultAppDIContainer {
    func resolve() -> GetExternalConfigurationUseCase {
        DefaultGetExternalConfigurationUseCase(firebaseService: resolve())
    }
}


// MARK: - Services
private extension DefaultAppDIContainer {
    func resolve() -> RESTService {
        RESTNetworkService(session: urlSession)
    }
    
    func resolve() -> FirebaseDatabaseService {
        DefaultFirebaseDatabaseService()
    }
}
