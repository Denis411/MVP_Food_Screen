import UIKit

final class MenuDishLoaderImp: MenuDishLoader {
    let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func loadDishes(type: DishType, for city: String, completionHandler: @escaping (Result<[MenuDishTableViewCellInfo], Error>) -> Void) {
//      load from the internet
        let fakeDishCellInfo = Array(repeating: 1, count: 10).map { _ in
            MenuDishTableViewCellInfo.getMockData()
        }

        completionHandler(.success(fakeDishCellInfo))
    }
}
