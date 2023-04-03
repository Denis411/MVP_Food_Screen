import UIKit

final class MenuTableView: UITableView {
    private var dishCellInfo: [MenuDishTableViewCellInfo] = []

    init() {
        super.init(frame: .zero, style: .plain)
        setSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuTableView {
    private func setSelf() {
        self.register(
            MenuTableViewCell.self,
            forCellReuseIdentifier: MenuTableViewCell.menuCellIdentifier
        )

        self.delegate = self
        self.dataSource = self
    }
}

extension MenuTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MenuTableViewCell.menuCellIdentifier,
            for: indexPath
        ) as! MenuTableViewCell

        let mock = MenuDishTableViewCellInfo.getMockData()
        cell.setCellInfo(mock)

        return cell
    }
}
