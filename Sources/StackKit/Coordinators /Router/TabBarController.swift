import UIKit

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let animated: Bool
    
    init(animated: Bool = true) {
        self.animated = animated
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")  }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView, animated else { return }

        let timeInterval: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.2) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.94, y: 0.94)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}

