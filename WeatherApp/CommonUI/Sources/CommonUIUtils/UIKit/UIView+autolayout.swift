import UIKit

public extension UIView {
    
    /// func allows to set layout for view
    /// - Parameters:
    ///   - top: top anchor
    ///   - leading: leading anchor
    ///   - bottom: bottom anchor
    ///   - trailing: trailing anchor
    ///   - paddingTop: distance from top anchor
    ///   - paddingleading: distance from leading anchor
    ///   - paddingBottom: distance from bottom anchor
    ///   - paddingtrailing: distance from trailing anchor
    ///   - width: width of view
    ///   - height: height of view
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingleading: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingtrailing: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingleading).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingtrailing).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    /// function centers object in view in X and Y axis
    /// - Parameters:
    ///   - view: view that we center in
    ///   - yConstant: offset for height
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    
    /// function centers object in view in X axis
    /// - Parameters:
    ///   - view: view that we center in
    ///   - topAnchor: topAnchor of that view
    ///   - paddingTop: distance from topAnchor
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    /// function centers object in view in Y axis
    /// - Parameters:
    ///   - view: view that we center in
    ///   - leadingAnchor: leadingAnchor of that view
    ///   - paddingleading: distance from leadingAnchor
    ///   - constant: offset for height
    func centerY(inView view: UIView, leadingAnchor: NSLayoutXAxisAnchor? = nil, paddingleading: CGFloat? = nil, constant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
        
        if let leadingAnchor = leadingAnchor, let padding = paddingleading {
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        }
    }
    
    /// function sets dimensions for object
    /// - Parameters:
    ///   - width: width of object
    ///   - height: height of object
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    /// function sets all anchors for object same as for view
    /// - Parameter view: view in which we are filling view
    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: view.topAnchor, leading: view.leadingAnchor,
               bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
