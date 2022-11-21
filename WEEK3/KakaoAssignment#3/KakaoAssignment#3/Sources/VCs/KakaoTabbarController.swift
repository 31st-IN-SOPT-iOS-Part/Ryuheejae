import UIKit


class KakaoTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class KakaoTabbarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    private let kakaoTabbar = KakaoTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(kakaoTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, KakaoTabbar.self)
        self.tabBar.itemPositioning = .centered
    }
}


