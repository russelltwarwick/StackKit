
import UIKit

final class TabBarCoordinator: BaseCoordinator {
    
    // MARK: UI
    
    private let tabBarItemInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
    
    // MARK: Dependencies
    
    private let coordinatorFactory: CoordinatorFactory
    typealias ModuleFactory = TabBarViewFactory & HomeViewFactory
    private let viewFactory: ModuleFactory
    
    // MARK: Init
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, viewFactory: ModuleFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.viewFactory = viewFactory
        super.init(router: router)
    }
    
    // MARK: Start
    
    override func start(with option: DeepLinkType?) {
        let tabs = [start2Coordinator(),
                    start3Coordinator(),
                    start4Coordinator(),
                    start5Coordinator()].compactMap({ $0 })
        
        let module = viewFactory.makeTabBar(tabs: tabs)
        
        router.setRoot(module, hideNavigation: true)
    }
    
    private func start2Coordinator() -> Presentable? {
        let navigationVC = SwipeNavigationController()
        navigationVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-home-2"), tag: 0)
        navigationVC.tabBarItem.imageInsets = tabBarItemInsets
        
        let coordinator = coordinatorFactory.makeHome(router: RouterImp(rootController: navigationVC))
        
        addDependency(coordinator)
        
        coordinator.start()

        return navigationVC
    }
    
    private func start3Coordinator() -> Presentable? {
        let navigationVC = SwipeNavigationController()
        navigationVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-news"), tag: 1)
        navigationVC.tabBarItem.imageInsets = tabBarItemInsets

        let coordinator = coordinatorFactory.makeNewsFeed(router: RouterImp(rootController: navigationVC))

        addDependency(coordinator)

        coordinator.start()

        return navigationVC
    }
    
    private func start4Coordinator() -> Presentable? {
        let navigationVC = SwipeNavigationController()
        navigationVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-launches"), tag: 2)
        navigationVC.tabBarItem.imageInsets = tabBarItemInsets

        let coordinator = coordinatorFactory.makeLaunches(router: RouterImp(rootController: navigationVC))

        addDependency(coordinator)

        coordinator.start()

        return navigationVC
    }
    
    private func start5Coordinator() -> Presentable? {
        let navigationVC = SwipeNavigationController()
        navigationVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-more"), tag: 3)
        navigationVC.tabBarItem.imageInsets = tabBarItemInsets

        let coordinator = coordinatorFactory.makeSettings(router: RouterImp(rootController: navigationVC))

        addDependency(coordinator)

        coordinator.start()

        return navigationVC
    }
}
