import UIKit

public extension UIView {
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    func isHidden(_ value: Bool = true) -> Self {
        self.isHidden = value
        return self
    }

    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    @discardableResult
    func tintColor(_ value: UIColor) -> Self {
        self.tintColor = value
        return self
    }
    
    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = value
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ value: Bool) -> Self {
        self.isUserInteractionEnabled = value
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    // MARK: Accessibility
    
    @discardableResult
    func accessibilityIdentifier(_ value: String) -> Self {
        self.accessibilityIdentifier = value
        return self
    }
    
    func accessibilityLabel(_ value: String) -> Self {
        self.accessibilityLabel = value
        return self
    }
    
    func accessibilityHint(_ value: String) -> Self {
        self.accessibilityHint = value
        return self
    }
    
    // MARK: Layer
    
    func clipsToBounds(_ value: Bool) -> Self {
        self.clipsToBounds = value
        return self
    }
    
    func borderColor(_ color: UIColor) -> Self {
        self.layer.borderColor = color.cgColor
        return self
    }
    
    func borderWidth(_ value: CGFloat) -> Self {
        self.layer.borderWidth = value
        return self
    }
    
    func masksToBounds(_ value: Bool) -> Self {
        self.layer.masksToBounds = value
        return self
    }
    
    @discardableResult
    func shadow(radius: CGFloat, opacity: Float, offset: CGSize, color: UIColor) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath.init(rect: bounds).cgPath
        return self
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        cornerRadius(radius, corners: .all)
        return self
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat, corners: CACornerMask) -> Self {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        layer.masksToBounds = true
        return self
    }
}

extension CACornerMask {
    static var topLeft: CACornerMask {
        .layerMinXMinYCorner
    }
    
    static var topRight: CACornerMask {
        .layerMaxXMinYCorner
    }
    
    static var bottomLeft: CACornerMask {
        .layerMinXMaxYCorner
    }
    
    static var bottomRight: CACornerMask {
        .layerMaxXMaxYCorner
    }
    
    static var all: CACornerMask {
        [.topLeft, .topRight, .bottomLeft, .bottomRight]
    }
}
