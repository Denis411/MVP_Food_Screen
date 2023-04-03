import Foundation

protocol MenuViewControllerProtocol: AnyObject {
    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo])
    func setDishTypeCellInfo(cellInfo: [DishTypeCellInfo])
}

// MARK: - MenuPresenterImp -

final class MenuPresenterImp {
    private weak var view: MenuViewControllerProtocol?
    private let availableTypesOfDishes = DishType.allCases
    private var dishTypeCellInfo: [DishTypeCellInfo] = []
}

extension MenuPresenterImp: MenuPresenterSettingView {
    func setView(_ view: MenuViewControllerProtocol) {
        self.view = view
    }
}

extension MenuPresenterImp: MenuPresenterFunctionality {
/// Sets initial data
    func loadView() {
//      set default dish types where pizza is selected
        for dishType in availableTypesOfDishes {
            let isSelected = (dishType == .pizza) ? true : false
            let info = DishTypeCellInfo(dishType: dishType, isSelected: isSelected)
            dishTypeCellInfo.append(info)
        }

        view?.setDishTypeCellInfo(cellInfo: dishTypeCellInfo)
        let fakeDishCellInfo = Array(repeating: 1, count: 10).map { _ in
            MenuDishTableViewCellInfo.getMockData()
        }

        view?.setDishCellInfo(cellInfo: fakeDishCellInfo)
    }

    func loadDishesCellInfo(for dishType: DishType?) {

    }
}
