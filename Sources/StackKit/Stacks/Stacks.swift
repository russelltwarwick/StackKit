import UIKit

public extension UIView {
    @discardableResult
    func ZStack(
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) -> UIStackView {
        let container = UIView()

        views().forEach { view in
            container.VStack { view }
        }

        return VStack(useSafeArea: useSafeArea) { container }
    }

    @discardableResult
    func VStack(
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) -> UIStackView {
        createStack(.vertical, views: views(), useSafeArea: useSafeArea)
    }

    @discardableResult
    func HStack(
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) -> UIStackView {
        createStack(.horizontal, views: views(), useSafeArea: useSafeArea)
    }
}

// MARK: Class Variants

public final class ZStack: UIStackView {
    public init(@ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(frame: .zero)
        let container = UIView()

        views().forEach { view in
            container.VStack { view }
        }

        addArrangedSubview(container)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class VStack: UIStackView {
    public init(@ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .vertical
        views().forEach {
            addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class HStack: UIStackView {
    public init(@ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .horizontal
        views().forEach {
            addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: Builder

extension UIView {
    @discardableResult
    func createStack(
        _ axis: NSLayoutConstraint.Axis = .vertical,
        views: [UIView],
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        useSafeArea: Bool
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: useSafeArea ? safeAreaLayoutGuide.topAnchor : topAnchor),
            stackView.trailingAnchor.constraint(equalTo: useSafeArea ? safeAreaLayoutGuide.trailingAnchor : trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: useSafeArea ? safeAreaLayoutGuide.bottomAnchor : bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: useSafeArea ? safeAreaLayoutGuide.leadingAnchor : leadingAnchor)
        ])
        
        return stackView
    }
}
