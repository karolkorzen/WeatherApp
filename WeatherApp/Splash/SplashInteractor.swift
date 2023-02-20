import Foundation
import UIKit
import Routes
import XCoordinator
import CoreUseCases
import Combine
import CommonResources

public protocol SplashInteractor {}

final public class DefaultSplashInteractor: SplashInteractor {
    // MARK: Properties
    private let router: WeakRouter<AppRoute>
    private let getExternalConfigurationUseCase: GetExternalConfigurationUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    public init(
        router: WeakRouter<AppRoute>,
        getExternalConfigurationUseCase: GetExternalConfigurationUseCase
    ) {
        self.router = router
        self.getExternalConfigurationUseCase = getExternalConfigurationUseCase
        
        setupApp()
    }
}

private extension DefaultSplashInteractor {
    func setupApp() {
        getExternalConfigurationUseCase.execute()
            .mapResult()
            .sink { [unowned self] result in
                switch result {
                case .success:
                    router.trigger(.startApp)
                case .failure(_):
                    showSetupError()
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: Navigation utils
private extension DefaultSplashInteractor {
    func showSetupError() {
        router.trigger(
            .showAlert(
                title: L10n.error,
                message: L10n.unknownErrorHasOccured,
                actions: [
                    UIAlertAction(title: L10n.retry, style: .default) { [unowned self] _ in
                        setupApp()
                    }
                ]
            )
        )
    }
}

