import Foundation
import UIKit
import CommonResources
import CommonUIUtils

public enum ViewTemplates {
    public static func containerView(backgroundColor: UIColor? = .appTint) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 10
        
        return view
    }
    
    public static func standardLabel(font: UIFont = .appBody, textColor: UIColor? = .appPrimaryText) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.font = font
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }
    
    public static func blankView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.init(rawValue: 1), for: .horizontal)
        view.setContentCompressionResistancePriority(.init(rawValue: 1), for: .vertical)
        return view
    }
    
    public static func activityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .appPrimaryText
        return activityIndicator
    }
}
