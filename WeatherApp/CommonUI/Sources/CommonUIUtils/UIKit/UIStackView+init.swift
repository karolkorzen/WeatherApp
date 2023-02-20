import UIKit

public extension UIStackView {
    static func horizontal(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = spacing
        return stack
    }

    static func vertical(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = spacing
        return stack
    }
}
