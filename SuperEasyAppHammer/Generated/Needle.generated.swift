

import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->TapBarControllerComponent") { component in
        return TapBarComponentDependencyf6e31cc432e7f2b42353Provider(component: component)
    }
    
}

// MARK: - Providers

private class TapBarComponentDependencyf6e31cc432e7f2b42353BaseProvider: TapBarComponentDependency {
    var menuScreenComponent: MenuScreenComponent {
        return rootComponent.menuScreenComponent
    }
    var contactViewController: UIViewController {
        return rootComponent.contactViewController
    }
    var profileViewController: UIViewController {
        return rootComponent.profileViewController
    }
    var trashBidViewController: UIViewController {
        return rootComponent.trashBidViewController
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->TapBarControllerComponent
private class TapBarComponentDependencyf6e31cc432e7f2b42353Provider: TapBarComponentDependencyf6e31cc432e7f2b42353BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
