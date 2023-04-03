import UIKit
import SnapKit

struct DishTypeCellInfo {
    let dishType: DishType
    var isSelected: Bool
}

final class DishTypeScrollableView: UIView {
    private let scrollView = UIScrollView()
    private let horizontalStack = UIStackView()
    private var cellInfo: [DishTypeCellInfo] = []
    var dishTypeDelegate: DishTypeCellViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDishTypeCellInfo(_ cellInfo: [DishTypeCellInfo]) {
        self.cellInfo = cellInfo
// TODO: Create dequeueing cells use flyweight pattern
        horizontalStack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        for info in cellInfo {
            let dishTypeCellView = DishTypeCellView()
            dishTypeCellView.setDishType(info.dishType)
            dishTypeCellView.setSelectionState(isSelected: info.isSelected)
            dishTypeCellView.dishTypeDelegate = dishTypeDelegate
            horizontalStack.addArrangedSubview(dishTypeCellView)
        }
    }
}

// MARK: - Set up constraints -
extension DishTypeScrollableView {
    private func setUI() {
        setAllSubviews()

        addAllSubviews()
        setScrollViewConstraints()
        setHorizontalStackConstraints()
    }

    private func addAllSubviews() {
        self.addSubview(scrollView)
        scrollView.insertSubview(horizontalStack, at: 0)
    }

    private func setScrollViewConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setHorizontalStackConstraints() {
        horizontalStack.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
    }
}

extension DishTypeScrollableView {
    private func setAllSubviews() {
        setHorizontalStack()
    }

    private func setHorizontalStack() {
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 10
        horizontalStack.alignment = .center
    }
}
