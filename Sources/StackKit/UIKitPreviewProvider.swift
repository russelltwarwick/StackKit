import UIKit
import SwiftUI

@available(iOS 13.0, *)
public struct UIViewControllerPreview: UIViewControllerRepresentable {
    
    private let viewController: UIViewController

    public init(_ builder: @escaping () -> UIViewController) {
        viewController = builder()
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
    
    public func updateUIViewController(_ viewController: UIViewController, context: Context) {
        viewController.view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        viewController.view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
