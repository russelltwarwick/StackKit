import UIKit

public enum PaddingEdges {
    case top(CGFloat)
    case bottom(CGFloat)
    case left(CGFloat)
    case right(CGFloat)
    case all(CGFloat)
    case vertical(CGFloat)
    case horizontal(CGFloat)
}

public struct PaddingEdgesCalculator {
    let edges: [PaddingEdges]

    var edgeInset: UIEdgeInsets {
        var top: CGFloat = .zero
        var bottom: CGFloat = .zero
        var left: CGFloat = .zero
        var right: CGFloat = .zero

        edges.forEach { edge in
            switch edge {
            case let .top(value):
                top = value
            case let .bottom(value):
                bottom = value
            case let .left(value):
                left = value
            case let .right(value):
                right = value
            case let .all(value):
                top = value
                bottom = value
                left = value
                right = value
            case let .vertical(value):
                top = value
                bottom = value
            case let .horizontal(value):
                left = value
                right = value
            }
        }

        return .init(top: top, left: left, bottom: bottom, right: right)
    }
}

public enum SizingConstraints {
    case greaterThan(CGFloat)
    case lessThan(CGFloat)
    case equalTo(CGFloat)
}

// MARK: Frame

public extension UIView {
    @discardableResult
    func frame(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority) -> Self {
        setSize(width: width, height: height, priority: priority)
    }
    
    @discardableResult
    func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        setSize(width: width, height: height)
    }

    @discardableResult
    func frame(square: CGFloat) -> Self {
        setSize(width: square, height: square)
    }

    @discardableResult
    func frame(square: CGFloat, priority: UILayoutPriority) -> Self {
        setSize(width: square, height: square, priority: priority)
    }
}

// MARK: Width

public extension UIView {
    @discardableResult
    func width(_ value: CGFloat) -> Self {
        width(.equalTo(value))
    }

    @discardableResult
    func width(_ sizing: SizingConstraints, priority: UILayoutPriority = .required) -> Self {
        switch sizing {
        case let .greaterThan(value):
            return setGreaterThan(width: value, priority: priority)
        case let .lessThan(value):
            return setLessThan(width: value, priority: priority)
        case let .equalTo(value):
            return setSize(width: value, priority: priority)
        }
    }
}

// MARK: Height

public extension UIView {
    @discardableResult
    func height(_ value: CGFloat) -> Self {
        height(.equalTo(value))
    }

    @discardableResult
    func height(_ sizing: SizingConstraints, priority: UILayoutPriority = .required) -> Self {
        switch sizing {
        case let .greaterThan(value):
            return setGreaterThan(height: value, priority: priority)
        case let .lessThan(value):
            return setLessThan(height: value, priority: priority)
        case let .equalTo(value):
            return setSize(height: value, priority: priority)
        }
    }
}

// MARK: Aspect Ratio

public extension UIView {
    @discardableResult
    func aspectRatio(width: CGFloat, height: CGFloat, priority: UILayoutPriority = .required) -> Self {
        assert(height == .zero || width == .zero, "Aspect ratio can't divide with zero")
        let value = height / width
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = widthAnchor.constraint(equalTo: heightAnchor, multiplier: value)
        anchor.priority = priority
        anchor.isActive = true
        return self
    }

    /// Height / width calculation
    @discardableResult
    func aspectRatio(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = widthAnchor.constraint(equalTo: heightAnchor, multiplier: value)
        anchor.priority = priority
        anchor.isActive = true
        return self
    }
}

// MARK: Private Helper Methods

private extension UIView {
    @discardableResult
    private func setSize(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            width.flatMap { widthAnchor.constraint(equalToConstant: $0) },
            height.flatMap { heightAnchor.constraint(equalToConstant: $0) }
        ].compactMap {
            $0?.priority = priority
            return $0
        })
        return self
    }

    @discardableResult
    private func setGreaterThan(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            width.flatMap { widthAnchor.constraint(greaterThanOrEqualToConstant: $0) },
            height.flatMap { heightAnchor.constraint(greaterThanOrEqualToConstant: $0) }
        ].compactMap {
            $0?.priority = priority
            return $0
        })
        return self
    }

    @discardableResult
    private func setLessThan(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            width.flatMap { widthAnchor.constraint(lessThanOrEqualToConstant: $0) },
            height.flatMap { heightAnchor.constraint(lessThanOrEqualToConstant: $0) }
        ].compactMap {
            $0?.priority = priority
            return $0
        })
        return self
    }
}
