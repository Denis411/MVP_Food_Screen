import UIKit
import SnapKit

typealias MenuPresenter = MenuPresenterFunctionality & MenuPresenterSettingView

protocol MenuPresenterFunctionality: AnyObject {
    func loadView()
    func loadDishesCellInfo(for dishType: DishType?)
}

protocol MenuPresenterSettingView {
    func setView(_ view: MenuViewControllerProtocol)
}

// MARK: - MenuViewController -

class MenuViewController: UIViewController {
    private let presenter: MenuPresenter
    private var customView: MenuScreenView { view as! MenuScreenView }

    init(presenter: MenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        customView.setDidChangeDishTypeAction{ [weak self] newType in
            self?.presenter.loadDishesCellInfo(for: newType)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MenuScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadView()
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    func setAdvertisementInfo(cellInfo: [MenuAdvertisementCellInfo]) {
        customView.setAdvertisementInfo(cellInfo)
    }

    /// Sets available types of dishes
    func setDishTypeCellInfo(cellInfo: [DishTypeCellInfo]) {
        customView.setDishTypeCellInfo(cellInfo)
    }

    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo]) {
        customView.setMenuTableViewCellInfo(cellInfo)
    }
}
