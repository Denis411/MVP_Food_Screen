import UIKit

final class MenuTableView: UITableView {
    private var dishCellInfo: [MenuDishTableViewCellInfo] = []
    private var didScrollAction: ((CGFloat) -> Void)?

    init() {
        super.init(frame: .zero, style: .plain)
        setSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCellInfo(_ cellInfo: [MenuDishTableViewCellInfo]) {
        self.dishCellInfo = cellInfo
        self.reloadData()
    }

    func setDidScrollAction(action: @escaping (CGFloat) -> Void) {
        self.didScrollAction = action
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
        dishCellInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MenuTableViewCell.menuCellIdentifier,
            for: indexPath
        ) as! MenuTableViewCell

        let cellInfo = dishCellInfo[indexPath.row]
        cell.setCellInfo(cellInfo)

        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScrollAction?(scrollView.contentOffset.y)
    }
}
