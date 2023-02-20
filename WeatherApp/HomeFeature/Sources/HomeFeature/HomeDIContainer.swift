import Foundation
import XCoordinator
import Networking
import Routes
import CoreUseCases
import CoreServices

public final class HomeModuleDependencies {
    let resolveRESTService: () -> RESTService
    
    public init(
        resolveRESTService: @escaping () -> RESTService
    ) {
        self.resolveRESTService = resolveRESTService
    }
}

public protocol HomeDIContainer {
    func resolve(router: WeakRouter<HomeRoute>) -> SearchLocationsInteractor
}

public final class DefaultHomeDIContainer: HomeDIContainer {
    private let dependencies: HomeModuleDependencies
    
    public init(dependencies: HomeModuleDependencies) {
        self.dependencies = dependencies
    }
}

//MARK: - Interactors
public extension DefaultHomeDIContainer {
    func resolve(router: WeakRouter<HomeRoute>) -> SearchLocationsInteractor {
        DefaultSearchLocationsInteractor(
            searchLocationsUseCase: resolve(),
            router: router
        )
    }
}

//MARK: - UseCases
private extension DefaultHomeDIContainer {
    func resolve() -> SearchLocationsUseCase {
        DefaultSearchLocationsUseCase(locationsService: resolve())
    }
}

//MARK: - Services
private extension DefaultHomeDIContainer {
    func resolve() -> LocationsService {
        DefaultLocationsService(restService: dependencies.resolveRESTService())
    }
}
