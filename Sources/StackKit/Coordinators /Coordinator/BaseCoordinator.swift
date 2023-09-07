/* DOCS
    NAMING
    • Use show to show a view controller
    • Use runFlow to start a new coordinator
    USAGE
    • When we want to create a new page that has a new NavgiationController. We need to pass back a module and a coorindator
*/

import UIKit

class BaseCoordinator: Coordinator {

    // MARK: Dependencies
    
    var router: Router
    
    // MARK:
    
    private var childCoordinators: [Coordinator] = []
    
    // MARK: Init
    
    init(router: Router) {
        self.router = router
    }
  
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkType?) {
        
    }
  
    // MARK: Control memory
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators { // Add only unique objects
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
