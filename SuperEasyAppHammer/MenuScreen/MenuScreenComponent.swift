//
//  MainScreenComponent.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import NeedleFoundation

final class MenuScreenComponent: EmptyDependency {
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
