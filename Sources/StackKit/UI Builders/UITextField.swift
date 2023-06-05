import UIKit

public extension UITextField {
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
    func placeholder(_ value: String) -> Self {
        self.placeholder = value
        return self
    }

    @discardableResult
    func clearsOnBeginEditing(_ value: Bool) -> Self {
        self.clearsOnBeginEditing = value
        return self
    }

    @discardableResult
    func clearsOnInsertion(_ value: Bool) -> Self {
        self.clearsOnInsertion = value
        return self
    }

    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func autocapitalizationType(_ value: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = value
        return self
    }

    @discardableResult
    func autocorrectionType(_ value: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = value
        return self
    }

    @discardableResult
    func spellCheckingType(_ value: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = value
        return self
    }

    @discardableResult
    func isSecureTextEntry(_ value: Bool) -> Self {
        self.isSecureTextEntry = value
        return self
    }

    @discardableResult
    func rightView(_ view: UIView?) -> Self {
        self.rightView = view
        return self
    }

    @discardableResult
    func rightViewMode(_ mode: UITextField.ViewMode) -> Self {
        self.rightViewMode = mode
        return self
    }
    
    @discardableResult
    func leftView(_ view: UIView?) -> Self {
        self.leftView = view
        return self
    }

    @discardableResult
    func leftViewMode(_ mode: ViewMode) -> Self {
        self.leftViewMode = mode
        return self
    }

    // MARK: - Sizing text

    @discardableResult
    func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = value
        return self
    }

    // MARK: - Managing the editing behavior

    @discardableResult
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool = true) -> Self {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }

    // MARK: - Background appearance

    @discardableResult
    func borderStyle(_ style: BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }

    @discardableResult
    func background(_ image: UIImage?) -> Self {
        self.background = image
        return self
    }

    @discardableResult
    func disabledBackground(_ image: UIImage?) -> Self {
        self.disabledBackground = image
        return self
    }

    // MARK: - Overlay

    @discardableResult
    func clearButtonMode(_ mode: ViewMode) -> Self {
        self.clearButtonMode = mode
        return self
    }

    @discardableResult
    func inputView(_ view: UIView?) -> Self {
        self.inputView = view
        return self
    }

    @discardableResult
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.inputAccessoryView = inputAccessoryView
        return self
    }

    // MARK: - Tag

    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
}
