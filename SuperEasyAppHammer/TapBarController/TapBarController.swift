import UIKit

class TapBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        setSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TapBarController {
    private func setSelf() {
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .white
    }
}

// MARK: Mock images
extension TapBarController {
/// The method should only be run after having items
    func setMockImages() {
        assert(self.tabBar.items != nil)

        guard let items = self.tabBar.items else {
            return
        }

        let menuImage = UIImage(systemName: "menucard.fill")
        let contactImage = UIImage(systemName: "mappin.and.ellipse")
        let profileImage =  UIImage(systemName: "person.fill")
        let trashBinImage = UIImage(systemName: "trash")

        for itemIndex in 0..<items.count {
            switch itemIndex {
            case 0:
                items[itemIndex].image = menuImage
            case 1:
                items[itemIndex].image = contactImage
            case 2:
                items[itemIndex].image = profileImage
            case 3:
                items[itemIndex].image = trashBinImage
            default:
                assert(items.count > 4)
                return
            }
        }
    }
}
