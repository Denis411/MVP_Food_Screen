import NeedleFoundation

protocol MenuScreenComponentDependency: Dependency {
    var networkManager: NetworkManager { get }
}

final class MenuScreenComponent: Component<MenuScreenComponentDependency> {
    private var mainViewController: UIViewController {
        let presenter = presenter
        let menuViewController = MenuViewController(presenter: presenter)
        presenter.setView(menuViewController)
        return menuViewController
    }

    private var presenter: MenuPresenter {
        MenuPresenterImp(
            menuDishLoader: self.menuDishLoader,
            advertisementPicLoader: self.advertisementPicLoader
        )
    }
}

// MARK: - Use cases -
extension MenuScreenComponent {
    private var menuDishLoader: MenuDishLoader {
        MenuDishLoaderImp()
    }

    private var advertisementPicLoader: MenuAdvertisementPicLoader {
        MenuAdvertisementPicLoaderImp()
    }
}

extension MenuScreenComponent {
    func getMainViewController() -> UIViewController {
        self.mainViewController
    }
}
