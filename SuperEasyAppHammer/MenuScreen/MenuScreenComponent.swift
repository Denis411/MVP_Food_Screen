//
//  MainScreenComponent.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import NeedleFoundation

final class MenuScreenComponent: EmptyDependency {
    private var mainViewController: UIViewController {
        MenuViewController()
    }
}

extension MenuScreenComponent {
    func getMainViewController() -> UIViewController {
        self.mainViewController
    }
}
