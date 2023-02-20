import UIKit
import CommonResources
import CommonUIUtils
import CommonUIComponents

final class SplashView: UIView {
    // MARK: Views
    private let activityIndicator: UIActivityIndicatorView = ViewTemplates.activityIndicator()

    // MARK: Lifecycle
    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SplashView {
    func setupView() {
        backgroundColor = .appBackground
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(activityIndicator)

        activityIndicator.center(inView: view)
    }
}
