// DI mannager

import NeedleFoundation

final class RootComponent: BootstrapComponent {
    var navigationController: UINavigationController {
        shared {
            let rootViewController = UIViewController()
            rootViewController.view.backgroundColor = .white
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.isNavigationBarHidden = true
            navigationController.isToolbarHidden = true
            let startingVC = self.menuScreenComponent.getMainViewController()
            navigationController.pushViewController(
                startingVC , animated: false
            )
            return navigationController
        }
    }

    var menuScreenComponent: MenuScreenComponent { MenuScreenComponent() }
}
