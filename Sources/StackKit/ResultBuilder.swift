import Foundation

@resultBuilder
public struct ResultBuilder<I> {

    public typealias Expression = I
    public typealias Component = [I]

    public static func buildExpression(_ expression: Expression) -> Component {
        [expression]
    }

    public static func buildExpression(_ expression: Component) -> Component {
        expression
    }

    public static func buildExpression(_ expression: Expression?) -> Component {
        guard let expression = expression else { return [] }
        return [expression]
    }

    public static func buildBlock(_ children: Component...) -> Component {
        children.flatMap { $0 }
    }

    public static func buildBlock(_ component: Component) -> Component {
        component
    }

    public static func buildOptional(_ children: Component?) -> Component {
        children ?? []
    }

    public static func buildEither(first child: Component) -> Component {
        child
    }

    public static func buildEither(second child: Component) -> Component {
        child
    }

    public static func buildArray(_ components: [Component]) -> Component {
        components.flatMap { $0 }
    }
}
