// DI mannager

import NeedleFoundation

final class RootComponent: BootstrapComponent {
    var navigationController: UINavigationController {
        shared {
            let rootViewController = self.tapBarControllerComponent.getTapBarController()
            rootViewController.view.backgroundColor = .white
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.isNavigationBarHidden = true
            navigationController.isToolbarHidden = true
            return navigationController
        }
    }

    var networkManager: NetworkManager { NetworkManagerImp() }
    
    var tapBarControllerComponent: TapBarControllerComponent {
        TapBarControllerComponent(parent: self)
    }

    var menuScreenComponent: MenuScreenComponent {
        MenuScreenComponent(parent: self)
    }
}

// MARK: Mocks
extension RootComponent {
    var contactViewController: UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        return vc
    }

    var profileViewController: UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        return vc
    }

    var trashBidViewController: UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        return vc
    }
}
