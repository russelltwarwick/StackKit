import UIKit

public extension UIStackView {
    @discardableResult
    func padding(_ value: PaddingEdges...) -> Self {
        layoutMargins = PaddingEdgesCalculator(edges: value).edgeInset
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }

    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }

    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func removeAllArrangedSubviews() -> [UIView] {
        arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
            removeArrangedSubview(subview)
            NSLayoutConstraint.deactivate(subview.constraints)
            subview.removeFromSuperview()
            return removedSubviews + [subview]
        }
    }
}
