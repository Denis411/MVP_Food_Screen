import UIKit
import NeedleFoundation

protocol TapBarComponentDependency: Dependency {
    var menuScreenComponent: MenuScreenComponent { get }
    var contactViewController: UIViewController { get }
    var profileViewController: UIViewController { get }
    var trashBidViewController: UIViewController { get }
}

final class TapBarControllerComponent: Component<TapBarComponentDependency> {
    private var tapBarController: TapBarController {
        let tapBarViewController = TapBarController()
        setViewControllers(for: tapBarViewController)
        return tapBarViewController
    }

    private func setViewControllers(for tapBarViewController: TapBarController) {
        let menuVC = dependency.menuScreenComponent.getMainViewController()
        let contactVC = dependency.contactViewController
        let profileVC = dependency.profileViewController
        let trackBinVC = dependency.trashBidViewController

        menuVC.title = "Mеню"
        contactVC.title = "Kонтакты"
        profileVC.title = "Профиль"
        trackBinVC.title = "Kорзина"

        tapBarViewController.setViewControllers(
            [menuVC, contactVC, profileVC, trackBinVC],
            animated: false
        )

        tapBarViewController.setMockImages()
    }
}

extension TapBarControllerComponent {
    func getTapBarController() -> TapBarController {
        self.tapBarController
    }
}
