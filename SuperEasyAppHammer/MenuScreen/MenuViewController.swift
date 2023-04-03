//
//  ViewController.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    private let tableView = MenuTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}

