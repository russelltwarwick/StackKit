import UIKit

final class HomeCoordinator: BaseCoordinator, CoordinatorOutput {
    var finishFlow: ((CoordinatorOutputResult?) -> Void)?
    
    // MARK: Dependencies
    
    typealias ViewFactory = HomeViewFactory & InAppWebFactory & InAppVideoFactory & LaunchDetailsFactory & NotificationFactory
    private let viewFactory: ViewFactory
    private let coordinatorFactory: CoordinatorFactory
    
    // MARK: Init
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, viewFactory: ViewFactory){
        self.coordinatorFactory = coordinatorFactory
        self.viewFactory = viewFactory
        super.init(router: router)
    }
    
    // MARK: Start
    
    override func start(with option: DeepLinkType?) {
        showHome()
    }
    
    private func showHome() {
        let actions = HomeActions()
        let view = viewFactory.makeHome(actions: actions)
        
        actions.output.didSelectLaunch = { [weak self] launch in
            self?.runLaunch(launch: launch)
        }
        
        actions.output.didSelectArticle = { [weak self] article in
            guard let self else { return }
            let view = self.viewFactory.makeInAppWebView(url: URL(string: article.url), title: article.title)
            self.router.fittedSheet(module: view,size: .fullscreen)
        }
        
        actions.output.didSelectVideo = { [weak self] video in
            guard let self else { return }
            let view = self.viewFactory.makeVideo(url: video.youtubeId, title: video.title)
            self.router.fittedSheet(module: view, size: .fullscreen)
        }
        
        actions.output.didTapReview = { [weak self] url in
            self?.openURL(url)
        }
        
        actions.output.showNotifications = { [weak self] user in
            guard let user else { return }
            self?.runNotifications(user: user)
        }
        
        router.setRoot(view, hideNavigation: true)
    }
        
    private func openURL(_ url: URL?){
        if let url = url {
            UIApplication.shared.open(url)
        }
    }
    
    private func runNotifications(user: UserModel) {
        let actions = NotificationViewActions()
        let view = viewFactory.makeNotifications(user: user, actions: actions)
        
        actions.output.didTapSave = { [weak self] in
            self?.router.dismiss(animated: true)
        }
        
        actions.output.showPromptController = { [weak self] controller in
            self?.router.present(controller)
        }
        
        router.fittedSheet(module: view, size: .intrinsic)
    }
    
    private func runLaunch(launch: LaunchModel) {
        let coordinator = coordinatorFactory.makeLaunchDetails(launch: launch, router: router)
        
        addDependency(coordinator)
        
        coordinator.finishFlow = { [weak self, weak coordinator] imagePickerResult in
            self?.removeDependency(coordinator)
        }

        coordinator.start()
    }
}
