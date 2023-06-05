import UIKit

public extension UIButton {
    
    convenience init(_ title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    @discardableResult
    func disabled(_ disabled: Bool = true) -> Self {
        self.isEnabled = !disabled
        return self
    }

    @discardableResult
    func enabled(_ enabled: Bool = true) -> Self {
        self.isEnabled = enabled
        return self
    }

    // MARK: - Managing the title

    @discardableResult
    func title(_ title: String?, for state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }

    @discardableResult
    func attributedTitle(_ title: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(title, for: state)
        return self
    }

    @discardableResult
    func titleColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }

    // MARK: Images

    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }

    @discardableResult
    func image(_ name: String, for state: UIControl.State = .normal) -> Self {
        self.setImage(.init(named: name), for: state)
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func systemImage(_ name: String, for state: UIControl.State = .normal) -> Self {
        self.setImage(.init(systemName: name), for: state)
        return self
    }
}
