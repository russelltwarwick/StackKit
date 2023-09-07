
protocol DeepLinkType {

}

protocol Coordinator: AnyObject {
    
    var router: Router { get }
    
    func start()
    func start(with option: DeepLinkType?)
    
    func addDependency(_ coordinator: Coordinator)
    func removeDependency(_ coordinator: Coordinator?)
}

enum CoordinatorOutputResult {
    case normal
    case cancelled
    case error
    //these can be anything you want
}

protocol CoordinatorOutput: AnyObject {
    var finishFlow: ((CoordinatorOutputResult?) -> Void)? { get set }
}
