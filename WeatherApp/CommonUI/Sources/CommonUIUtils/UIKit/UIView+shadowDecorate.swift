import UIKit

public extension UIView {
    func shadowDecorate() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.33
    }
    
    func mildShadowDecorate(
        color: UIColor? = .lightGray,
        shadowRadius: CGFloat = 10,
        shadowOpacity: Float = 0.1
    ) {
        layer.masksToBounds = false
        layer.shadowColor = color?.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = 0.1
    }
    
    func mildShadowDecorateTop() {
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: -10)
    }
    
    func mildShadowDecorateBottom() {
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 10)
    }
}
