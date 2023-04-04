import UIKit

final class MenuScreenView: UIView {
    private let advertisementCollectionView = AdvertisementCollectionView()
    private var ADVERTISEMENT_INITIAL_HEIGHT: CGFloat = 100.0
    private var heightAdvertisementConstraint: NSLayoutConstraint? = nil
    private let dishTypeView = DishTypeScrollableView()
    private let tableView = MenuTableView()

    private var didChangeDishTypeAction: ((DishType?) -> Void)? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setDidScrollAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setAdvertisementInfo(_ cellInfo: [MenuAdvertisementCellInfo]) {
        self.advertisementCollectionView.setAdvertisementInfo(cellInfo)
    }

    func setDishTypeCellInfo(_ cellInfo: [DishTypeCellInfo]) {
        self.dishTypeView.setDishTypeCellInfo(cellInfo)
    }

    func setMenuTableViewCellInfo(_ cellInfo: [MenuDishTableViewCellInfo]) {
//  TODO: rename setCellInfo method to avoid redandency
        self.tableView.setCellInfo(cellInfo)
    }

    func setDidChangeDishTypeAction(_ action: @escaping (DishType?) -> Void) {
        self.didChangeDishTypeAction = action
    }
}

// MARK: - Logic on hiding advertisement scrollView -
extension MenuScreenView {
    private func setDidScrollAction() {
        tableView.setDidScrollAction { [weak self] verticalOffset in
            print(verticalOffset)
            guard let initialHeight = self?.ADVERTISEMENT_INITIAL_HEIGHT else {
                return
            }

            if verticalOffset > 0 {
                self?.setNeedsLayout()
                self?.heightAdvertisementConstraint?.constant = initialHeight - verticalOffset
                self?.layoutIfNeeded()
            }
        }
    }
}

// MARK: - Setting subviews -
extension MenuScreenView {
    private func setUI() {
        dishTypeView.dishTypeDelegate = self
        addAllSubviews()
        setAllSubviewsConstraints()
    }

    private func addAllSubviews() {
        self.addSubview(advertisementCollectionView)
        self.addSubview(dishTypeView)
        self.addSubview(tableView)
    }

// MARK: - Add constraints -
    private func setAllSubviewsConstraints() {
        addAdvertisementCollection()
        addDishTypeView()
        addTableView()
    }

    private func addAdvertisementCollection() {
        advertisementCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }

        heightAdvertisementConstraint = advertisementCollectionView.heightAnchor.constraint(equalToConstant: ADVERTISEMENT_INITIAL_HEIGHT)
        heightAdvertisementConstraint?.isActive = true
    }

    private func addDishTypeView() {
        dishTypeView.snp.makeConstraints { make in
            make.top.equalTo(advertisementCollectionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
    }

    private func addTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dishTypeView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

// TODO: - use closure in this case -
extension MenuScreenView: DishTypeCellViewDelegate {
    func didChangeDishType(dishType: DishType?) {
        didChangeDishTypeAction?(dishType)
    }
}
