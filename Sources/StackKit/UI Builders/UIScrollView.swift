import UIKit

public extension UIScrollView {
    @discardableResult
    func showsVerticalIndicator(_ value: Bool) -> Self {
        self.showsVerticalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func showsHorizontalIndicator(_ value: Bool) -> Self {
        self.showsHorizontalScrollIndicator = value
        return self
    }

    @discardableResult
    func alwaysBounceHorizontal(_ value: Bool) -> Self {
        self.alwaysBounceHorizontal = value
        return self
    }

    @discardableResult
    func alwaysBounceVertical(_ value: Bool) -> Self {
        self.alwaysBounceVertical = value
        return self
    }

    @discardableResult
    func delegate(_ value: UIScrollViewDelegate) -> Self {
        self.delegate = value
        return self
    }
}
