import Foundation

protocol MenuViewControllerProtocol: AnyObject {
    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo])
}

// MARK: - MenuPresenterImp -

final class MenuPresenterImp {
    private weak var view: MenuViewControllerProtocol?
}

extension MenuPresenterImp: MenuPresenterSettingView {
    func setView(_ view: MenuViewControllerProtocol) {
        self.view = view
    }
}

extension MenuPresenterImp: MenuPresenterFunctionality {
    func loadDishesCellInfo() {
        //        networking loading cellInfo
        let cellInfo = Array(repeating: 1, count: 10).map { _ in
            return MenuDishTableViewCellInfo.getMockData()
        }
        
        view?.setDishCellInfo(cellInfo: cellInfo)
    }
}
