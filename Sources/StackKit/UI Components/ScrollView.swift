import UIKit

public final class ScrollView: UIScrollView {
    
    // MARK: UI

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: Init

    public init(
        axis: NSLayoutConstraint.Axis,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        addSubview(stackView)
        
        if axis == .vertical {
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        } else {
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        views().forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: Scroll Extensions

public extension ScrollView {
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        stackView.spacing = spacing
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        stackView.alignment = alignment
        return self
    }
    
    @discardableResult
    func padding(_ value: PaddingEdges...) -> Self {
        stackView.layoutMargins = PaddingEdgesCalculator(edges: value).edgeInset
        stackView.isLayoutMarginsRelativeArrangement = true
        return self
    }
}
