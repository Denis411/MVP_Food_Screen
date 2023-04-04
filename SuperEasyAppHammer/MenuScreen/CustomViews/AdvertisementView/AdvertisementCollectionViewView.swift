import UIKit

final class AdvertisementCollectionViewView: UICollectionView {
    private var listOfAdvertisementCellInfo: [MenuAdvertisementCellInfo] = [] {
        didSet {
            self.reloadData()
        }
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setAdvertisementInfo(_ cellInfo: [MenuAdvertisementCellInfo]) {
        self.listOfAdvertisementCellInfo = cellInfo
    }
}

// MARK: - Set self -
extension AdvertisementCollectionViewView {
    private func setSelf() {
        self.delegate = self
        self.dataSource = self
        self.register(AdvertisementCollectionViewCell.self,
                      forCellWithReuseIdentifier: AdvertisementCollectionViewCell.cellIdentifier)
    }
}

extension AdvertisementCollectionViewView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfAdvertisementCellInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCollectionViewCell.cellIdentifier, for: indexPath) as! AdvertisementCollectionViewCell

        cell.setCell(with: listOfAdvertisementCellInfo[indexPath.item])

        return cell
    }
}
