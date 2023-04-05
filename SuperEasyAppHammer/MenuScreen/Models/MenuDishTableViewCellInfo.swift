import UIKit

struct MenuDishTableViewCellInfo {
    let image: UIImage?
    let name: String?
    let description: String?
    let formatedPrice: String?
}

extension MenuDishTableViewCellInfo {
    static func getMockData() -> Self {
        MenuDishTableViewCellInfo(
            image: UIImage(systemName: "person")!,
            name: "Name",
            description: "Description",
            formatedPrice: "from 300 p"
        )
    }
}
