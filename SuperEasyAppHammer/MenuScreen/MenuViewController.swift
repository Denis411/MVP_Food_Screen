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
        addDishTypeView()
        addTableView()
    }

    private func addDishTypeView() {
        view.addSubview(dishTypeView)
        dishTypeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
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
    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo]) {
        tableView.setCellInfo(cellInfo)
    }

    /// Sets available types of dishes
    func setDishTypeCellInfo(cellInfo: [DishTypeCellInfo]) {
        dishTypeView.setDishTypeCellInfo(cellInfo)
    }
}

extension MenuViewController: DishTypeCellViewDelegate {
    func didChangeDishType(dishType: DishType?) {
        presenter.loadDishesCellInfo(for: dishType)
    }
}
