import Combine
import UIKit

final class SplashViewController: UIViewController {
    // MARK: Views
    private lazy var contentView: SplashView = {
        let view = SplashView()
        return view
    }()

    // MARK: Properties
    private let interactor: SplashInteractor
    private var cancellables = Set<AnyCancellable>()

    // MARK: Lifecycle

    init(interactor: SplashInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }
}
