import UIKit

public extension UIViewController {
    var presentedViewControllers: [UIViewController] {
        getPresentedViewControllers()
    }

    private func getPresentedViewControllers() -> [UIViewController] {
        var stack: [UIViewController?] = []
        var presented = presentedViewController

        while presented != nil {
            stack.append(presented)
            presented = presented?.presentedViewController
        }

        return stack.compactMap { $0 }
    }
}
