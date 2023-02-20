import UIKit

public extension UINavigationBar {
    func app(tintColor: UIColor, backgroundColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: tintColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        appearance.backgroundColor = backgroundColor
        compactAppearance = appearance
        standardAppearance = appearance
        scrollEdgeAppearance = appearance

        self.tintColor = tintColor
    }
}
