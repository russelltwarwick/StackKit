import UIKit

public extension UILabel {

    convenience init(_ text: String) {
        self.init(frame: .zero)
        self.text = text
    }

    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }

    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func systemFont(_ size: CGFloat, weight: UIFont.Weight) -> Self {
        self.font = .systemFont(ofSize: size, weight: weight)
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor?) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func numberOfLines(_ value: Int) -> Self {
        self.numberOfLines = value
        return self
    }

    @discardableResult
    func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        self.lineBreakMode = value
        return self
    }

    @discardableResult
    func isEnabled(_ value: Bool) -> Self {
        self.isEnabled = value
        return self
    }

    @discardableResult
    func showsExpansionTextWhenTruncated(_ value: Bool) -> Self {
        self.showsExpansionTextWhenTruncated = value
        return self
    }

    @discardableResult
    func highlightedTextColor(_ value: UIColor?) -> Self {
        self.highlightedTextColor = value
        return self
    }

    @discardableResult
    func isHighlighted(_ value: Bool) -> Self {
        self.isHighlighted = value
        return self
    }

    @discardableResult
    func allowsDefaultTighteningForTruncation(_ value: Bool) -> Self {
        self.allowsDefaultTighteningForTruncation = value
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = value
        return self
    }

    @discardableResult
    func baselineAdjustment(_ value: UIBaselineAdjustment) -> Self {
        self.baselineAdjustment = value
        return self
    }

    @discardableResult
    func minimumScaleFactor(_ value: CGFloat) -> Self {
        self.minimumScaleFactor = value
        return self
    }
}
