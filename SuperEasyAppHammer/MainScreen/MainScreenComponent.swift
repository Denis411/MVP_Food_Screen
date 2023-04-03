//
//  MainScreenComponent.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import NeedleFoundation

final class MainScreenComponent: EmptyDependency {
    private var mainViewController: UIViewController {
        ViewController()
    }
}

extension MainScreenComponent {
    func getMainViewController() -> UIViewController {
        self.mainViewController
    }
}
