import UIKit

public extension UIImageView {
    
    convenience init(_ name: String) {
        self.init(image: UIImage(named: name))
    }

    // MARK: - Acessing the displayed images

    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func systemImage(_ name: String) -> Self {
        self.image = .init(systemName: name)
        return self
    }

    @discardableResult
    func highlightedImage(_ image: UIImage?) -> Self {
        self.highlightedImage = image
        return self
    }
    
    @discardableResult
    func tint(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }

    @discardableResult
    func isHighlighted(_ value: Bool) -> Self {
        self.isHighlighted = value
        return self
    }
}

