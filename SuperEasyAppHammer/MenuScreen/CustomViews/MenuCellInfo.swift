import UIKit

struct MenuCellInfo {
    let image: UIImage?
    let name: String?
    let description: String?
    let buttonText: String?
}

extension MenuCellInfo {
    static func getMockData() -> Self {
        MenuCellInfo(
            image: UIImage(systemName: "person")!,
            name: "Name",
            description: "Description",
            buttonText: "from 300 p"
        )
    }
}
