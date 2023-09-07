
import UIKit
import FittedSheets

final class RouterImp: NSObject, Router {

    // MARK: Dependencies

    private weak var rootController: SwipeNavigationController?
    private var completions: [UIViewController : () -> Void]
    
    // MARK: Init
    
    init(rootController: SwipeNavigationController) {
        self.rootController = rootController
        self.completions = [:]
        super.init()
        self.rootController?.customDelegate = self
    }

    // MARK: Set Module To Root Of Navigation Controller
    
    func setRoot(_ module: Presentable?) {
        setRoot(module, hideNavigation: false)
    }

    func setRoot(_ module: Presentable?, hideNavigation: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.setNavigationBarHidden(hideNavigation, animated: false)
    }

    // MARK: Present Module & Dismiss
    
    func present(_ module: Presentable?, style: UIModalPresentationStyle, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        controller.modalPresentationStyle = style

        rootController?.present(controller, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool){
        rootController?.dismiss(animated: animated, completion: nil)
    }
    
    // MARK: Show Module & Pop Navigation Stack
    
    func show(_ module: Presentable?, animated: Bool, completion: (() -> Void)?){
        guard let controller = module?.toPresent() else { return }
        
        if let completion = completion {
            completions[controller] = completion
        }
                
        rootController?.show(controller, sender: self)
    }
    
    func show(_ module: Presentable?, animated: Bool = true, hideTabBar: Bool , completion: (() -> Void)? = nil) {
        guard let controller = module?.toPresent() else { return }
        controller.hidesBottomBarWhenPushed = hideTabBar
        
        if let completion = completion {
            completions[controller] = completion
        }
                
        rootController?.show(controller, sender: self)
    }

    func pop(animated: Bool)  {
        if let poppedViewController = rootController?.popViewController(animated: animated) {
            runCompletion(for: poppedViewController)
        }
    }
    
    func popToRoot(animated: Bool){
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
}

extension RouterImp {
    func fittedSheet(module: Presentable?, onTo: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        guard let onToController = onTo?.toPresent() else { return }
        let options = SheetOptions(
            // The full height of the pull bar. The presented view controller will treat this area as a safearea inset on the top
            pullBarHeight: 24,
            
            // The corner radius of the shrunken presenting view controller
            presentingViewCornerRadius: 20,
            
            // Extends the background behind the pull bar or not
            shouldExtendBackground: true,
            
            // Attempts to use intrinsic heights on navigation controllers. This does not work well in combination with keyboards without your code handling it.
            setIntrinsicHeightOnNavigationControllers: true,
            
            // Pulls the view controller behind the safe area top, especially useful when embedding navigation controllers
            useFullScreenMode: true,
            
            // Shrinks the presenting view controller, similar to the native modal
            shrinkPresentingViewController: true,
            
            // Determines if using inline mode or not
            useInlineMode: false,
            
            // Adds a padding on the left and right of the sheet with this amount. Defaults to zero (no padding)
            horizontalPadding: 0,
            
            // Sets the maximum width allowed for the sheet. This defaults to nil and doesn't limit the width.
            maxWidth: nil
        )
        let sheetController = SheetViewController(controller: controller,
                                                  sizes: [.fullscreen], options: options)
        
        sheetController.gripColor = C.font.secondary.withAlphaComponent(0.7)
        
        onToController.present(sheetController, animated: true, completion: nil)
    }
    
    
    func fittedSheet(module: Presentable?, size: SheetSize) {
        guard let controller = module?.toPresent() else { return }
        let options = SheetOptions(
            // The full height of the pull bar. The presented view controller will treat this area as a safearea inset on the top
            pullBarHeight: 24,
            
            // The corner radius of the shrunken presenting view controller
            presentingViewCornerRadius: 20,
            
            // Extends the background behind the pull bar or not
            shouldExtendBackground: true,
            
            // Attempts to use intrinsic heights on navigation controllers. This does not work well in combination with keyboards without your code handling it.
            setIntrinsicHeightOnNavigationControllers: true,
            
            // Pulls the view controller behind the safe area top, especially useful when embedding navigation controllers
            useFullScreenMode: true,
            
            // Shrinks the presenting view controller, similar to the native modal
            shrinkPresentingViewController: true,
            
            // Determines if using inline mode or not
            useInlineMode: false,
            
            // Adds a padding on the left and right of the sheet with this amount. Defaults to zero (no padding)
            horizontalPadding: 0,
            
            // Sets the maximum width allowed for the sheet. This defaults to nil and doesn't limit the width.
            maxWidth: nil
        )

        let sheetController = SheetViewController(controller: controller,
                                                  sizes: [size], options: options)
        
        sheetController.gripColor = C.font.secondary.withAlphaComponent(0.2)
        
        rootController?.present(sheetController, animated: true, completion: nil)
    }
}

extension RouterImp: NavigationControllerDelegate {
    
    //This handles what happens when a navigation stack is dismiss out of our control
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(poppedViewController) else { return }

        runCompletion(for: poppedViewController)
    }

    func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    func setNavigationBarHidden( _ isHidden: Bool) {
        rootController?.setNavigationBarHidden(isHidden, animated: false)
    }
}
