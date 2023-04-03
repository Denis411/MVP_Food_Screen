import UIKit

class MenuTableViewCellButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setSelf() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
        self.setTitleColor(.red, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
