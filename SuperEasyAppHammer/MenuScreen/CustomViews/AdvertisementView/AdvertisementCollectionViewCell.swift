import UIKit

final class AdvertisementCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "advertisementCellIdentifier"
    private let imageView = UIImageView()
    private var cellInfo: MenuAdvertisementCellInfo? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell(with cellInfo: MenuAdvertisementCellInfo) {
        self.cellInfo = cellInfo
        self.imageView.image = cellInfo.image
    }
}

extension AdvertisementCollectionViewCell {
    private func setImageView() {
        imageView.layer.cornerRadius = 7
        imageView.backgroundColor = .green
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
