//
//  ViewController.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import UIKit
import SnapKit

typealias MenuPresenter = MenuPresenterFunctionality & MenuPresenterSettingView

protocol MenuPresenterFunctionality: AnyObject {
    func loadDishesCellInfo()
}

protocol MenuPresenterSettingView {
    func setView(_ view: MenuViewControllerProtocol)
}

// MARK: - MenuViewController -

class MenuViewController: UIViewController {
    private let presenter: MenuPresenter
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
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadDishesCellInfo()
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo]) {
        tableView.setCellInfo(cellInfo)
    }
}
