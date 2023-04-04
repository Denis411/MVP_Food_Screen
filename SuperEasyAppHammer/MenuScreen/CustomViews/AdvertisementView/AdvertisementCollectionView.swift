import UIKit

final class AdvertisementCollectionView: UICollectionView {
    private let CELL_WIDTH = UIScreen.main.bounds.width * 0.80
    private let CELL_HEIGHT = UIScreen.main.bounds.width * 0.25
    private var listOfAdvertisementCellInfo: [MenuAdvertisementCellInfo] = [] {
        didSet {
            self.reloadData()
        }
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
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
extension AdvertisementCollectionView {
    private func setSelf() {
        self.delegate = self
        self.dataSource = self
        self.register(AdvertisementCollectionViewCell.self,
                      forCellWithReuseIdentifier: AdvertisementCollectionViewCell.cellIdentifier)
    }
}

extension AdvertisementCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfAdvertisementCellInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCollectionViewCell.cellIdentifier, for: indexPath) as! AdvertisementCollectionViewCell

        cell.setCell(with: listOfAdvertisementCellInfo[indexPath.item])

        return cell
    }
}

extension AdvertisementCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: CELL_WIDTH,
            height: CELL_HEIGHT
        )
    }
}
