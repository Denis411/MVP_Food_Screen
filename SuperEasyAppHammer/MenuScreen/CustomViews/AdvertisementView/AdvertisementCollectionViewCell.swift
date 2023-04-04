import UIKit

final class AdvertisementCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "advertisementCellIdentifier"
    private var cellInfo: MenuAdvertisementCellInfo? = nil

    func setCell(with cellInfo: MenuAdvertisementCellInfo) {
        self.cellInfo = cellInfo
    }
}
