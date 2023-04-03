import UIKit

protocol DishTypeCellViewDelegate {
    func didChangeDishType(dishType: DishType?)
}

final class DishTypeCellView: UILabel {
    private let LEFT_INSET = 20.0
    private let RIGHT_INSET = 20.0
    private let TOP_INSET = 10.0
    private let BOTTOM_INSET = 10.0
    private(set) var dishType: DishType? = nil
    var dishTypeDelegate: DishTypeCellViewDelegate?
    private var isSelected: Bool = false

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + LEFT_INSET + RIGHT_INSET,
                      height: size.height + TOP_INSET + BOTTOM_INSET
        )
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSelf()
        setGestureRecognizer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(
            top: TOP_INSET,
            left: LEFT_INSET,
            bottom: BOTTOM_INSET,
            right: RIGHT_INSET
        )

        super.drawText(in: rect.inset(by: insets))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height * 0.40
    }


    func setDishType(_ dishType: DishType) {
        self.dishType = dishType
        self.text = dishType.rawValue
    }
}

// MARK: - UI logic on selecting -
extension DishTypeCellView {
    private func setGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectCell))
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func didSelectCell() {
        isSelected.toggle()
        reactToSelecting()
    }

    func setSelectionState(isSelected: Bool) {
        self.isSelected = isSelected
        reactToSelecting()
    }

    private func reactToSelecting() {
        assert(dishType != nil)

        dishTypeDelegate?.didChangeDishType(dishType: dishType)
    }
}

extension DishTypeCellView {
    private func setSelf() {
        self.isUserInteractionEnabled = true
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2

        self.textColor = .red
        self.font = .systemFont(ofSize: 30)

        self.contentMode = .center
    }
}
