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
    private let advertisementCollectionView = AdvertisementCollectionView()
    private let dishTypeView = DishTypeScrollableView()
    private let tableView = MenuTableView()

    init(presenter: MenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dishTypeView.dishTypeDelegate = self
        addAdvertisementCollection()
        addDishTypeView()
        addTableView()
    }

    private func addAdvertisementCollection() {
        view.addSubview(advertisementCollectionView)
        advertisementCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    private func addDishTypeView() {
        view.addSubview(dishTypeView)
        dishTypeView.snp.makeConstraints { make in
            make.top.equalTo(advertisementCollectionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dishTypeView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadView()
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    func setAdvertisementInfo(cellInfo: [MenuAdvertisementCellInfo]) {
        advertisementCollectionView.setAdvertisementInfo(cellInfo)
    }

    /// Sets available types of dishes
    func setDishTypeCellInfo(cellInfo: [DishTypeCellInfo]) {
        dishTypeView.setDishTypeCellInfo(cellInfo)
    }

    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo]) {
        tableView.setCellInfo(cellInfo)
    }
}

extension MenuViewController: DishTypeCellViewDelegate {
    func didChangeDishType(dishType: DishType?) {
        presenter.loadDishesCellInfo(for: dishType)
    }
}
