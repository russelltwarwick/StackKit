
import UIKit
import FittedSheets

protocol Router {
    
    // MARK: Set Module To Root Of Navigation Controller

    func setRoot(_ module: Presentable?)
    func setRoot(_ module: Presentable?, hideNavigation: Bool)
    
    // MARK: Present & Dismiss
    
    func present(_ module: Presentable?, style: UIModalPresentationStyle, animated: Bool)
    func dismiss(animated: Bool)
    
    // MARK: Show & Pop Navigation Stack
    
    func show(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func show(_ module: Presentable?, animated: Bool, hideTabBar: Bool, completion: (() -> Void)?)
    
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    
    func setNavigationBarHidden( _ isHidden: Bool)
    
    func fittedSheet(module: Presentable?, size: SheetSize)
    func fittedSheet(module: Presentable?, onTo: Presentable?) 
}

extension Router {
    
    //Default behavior

    // MARK: Present Module & Dismiss
    
    func present(_ module: Presentable?, style: UIModalPresentationStyle = .fullScreen, animated: Bool = true){
        self.present(module, style: style, animated: animated)
    }
    
    func dismiss(animated: Bool = true){
        self.dismiss(animated: animated)
    }
    
    // MARK: Show Module & Pop Navigation Stack
    
    func show(_ module: Presentable?, animated: Bool = true, completion: (() -> Void)? = nil){
        self.show(module, animated: animated, completion: completion)
    }
    
    func show(_ module: Presentable?, animated: Bool = true, hideTabBar: Bool , completion: (() -> Void)? = nil) {
        self.show(module, animated: animated, hideTabBar: hideTabBar, completion: completion)
    }

    func pop(animated: Bool = true){
        self.pop(animated: animated)
    }
    
    func popToRoot(animated: Bool = true){
        self.popToRoot(animated: animated)
    }
}
