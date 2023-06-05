import UIKit
import SwiftUI

@available(iOS 13.0, *)
public struct UIViewPreview: UIViewRepresentable {
    
    private let view: UIView

    public init(_ builder: @escaping () -> UIView) {
        view = builder()
    }

    public func makeUIView(context: Context) -> UIView {
        view
    }
    
    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
