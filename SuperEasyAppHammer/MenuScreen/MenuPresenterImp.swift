import Foundation
import UIKit

// MARK: - ViewController protocol -
protocol MenuViewControllerProtocol: AnyObject {
    func setDishCellInfo(cellInfo: [MenuDishTableViewCellInfo])
    func setDishTypeCellInfo(cellInfo: [DishTypeCellInfo])
    func setAdvertisementInfo(cellInfo: [MenuAdvertisementCellInfo])
}

// MARK: - Use cases -
protocol MenuDishLoader {
    func loadDishes(type: DishType, for city: String, completionHandler: @escaping (Result<[MenuDishTableViewCellInfo], Error>) -> Void)
}

// MARK: - MenuPresenterImp -
final class MenuPresenterImp {
    private weak var view: MenuViewControllerProtocol?
    private let availableTypesOfDishes = DishType.allCases
    private var dishTypeCellInfo: [DishTypeCellInfo] = []

//  use cases
    private let menuDishLoader: MenuDishLoader = MenuDishLoaderImp()
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
        loadDishes(for: .pizza, in: "")
        loadAdvertisementImages()
    }

    func loadDishesCellInfo(for dishType: DishType?) {
        dishTypeCellInfo = []
        
        for type in availableTypesOfDishes {
            let isSelected = (type == dishType) ? true : false
            let info = DishTypeCellInfo(dishType: type, isSelected: isSelected)
            dishTypeCellInfo.append(info)
        }

        view?.setDishTypeCellInfo(cellInfo: dishTypeCellInfo)

        loadDishes(for: .beverage, in: "")
    }
}

extension MenuPresenterImp {
    private func loadDishes(for type: DishType, in city: String) {
        menuDishLoader.loadDishes(type: type, for: city) { [weak self] result in
            switch result {
            case .success(let listOfDishes):
                self?.view?.setDishCellInfo(cellInfo: listOfDishes)
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }

    private func loadAdvertisementImages() {
//        load images from the internet
        var listOfFakeCellInfo: [MenuAdvertisementCellInfo] = []
        for _ in 0..<50 {
            let mockImage = UIImage(systemName: "pencil")!
            let cellInfo = MenuAdvertisementCellInfo(image: mockImage)
            listOfFakeCellInfo.append(cellInfo)
        }

        view?.setAdvertisementInfo(cellInfo: listOfFakeCellInfo)
    }
}
