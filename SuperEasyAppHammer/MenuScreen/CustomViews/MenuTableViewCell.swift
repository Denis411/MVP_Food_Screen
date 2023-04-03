import UIKit

final class MenuTableViewCell: UITableViewCell {
    static let menuCellIdentifier = "MenuTableViewCell"
    private let dishImageView = UIImageView()
    private let dishNameTitle = UILabel()
    private let dishDescriptionTitle = UILabel()
    private let orderButton = MenuTableViewCellButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCellInfo(_ info: MenuDishTableViewCellInfo) {
        self.dishImageView.image = info.image
        self.dishNameTitle.text = info.name
        self.dishDescriptionTitle.text = info.description
        self.orderButton.setTitle(info.buttonText, for: .normal)
    }
}

// MARK: - Set up UI
extension MenuTableViewCell {
    private func setUI() {
        addAllSubviews()
        addDishImageViewConstraints()
        addDishNameTitleConstraints()
        addDishDescriptionTitleConstraints()
        addOrderButton()
    }

    private func addAllSubviews() {
        contentView.addSubview(dishImageView)
        contentView.addSubview(dishNameTitle)
        contentView.addSubview(dishDescriptionTitle)
        contentView.addSubview(orderButton)
    }

    private func addDishImageViewConstraints() {
        dishImageView.snp.makeConstraints { make in
            make.height.equalTo(100).priority(.low)
            make.width.equalTo(100)
            make.top.left.bottom.equalToSuperview()
        }
    }

    private func addDishNameTitleConstraints() {
        dishNameTitle.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.leading.equalTo(dishImageView.snp.trailing).offset(20)
        }
    }

    private func addDishDescriptionTitleConstraints() {
        dishDescriptionTitle.snp.makeConstraints { make in
            make.top.equalTo(dishNameTitle.snp.bottom).offset(20)
            make.trailing.equalToSuperview()
            make.left.equalTo(dishImageView.snp.right).offset(20)
        }
    }

    private func addOrderButton() {
        orderButton.snp.makeConstraints { make in
            make.top.equalTo(dishDescriptionTitle.snp.bottom).offset(20)
            make.right.bottom.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100).priority(.low)
        }
    }
}
