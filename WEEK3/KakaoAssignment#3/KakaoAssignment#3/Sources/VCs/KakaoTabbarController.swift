import UIKit

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

extension KakaoTabbarController : UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let friendViewController = FriendTabbleViewController()
        let friendNavigationController =  UINavigationController(rootViewController: friendViewController)
        friendNavigationController.navigationBar.isHidden = true
        
        let chatViewController = ChatCollectionViewController()
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        chatNavigationController.navigationBar.isHidden = true
        
        let sharpViewController = SharpViewController()
        let sharpNavigationController = UINavigationController(rootViewController: sharpViewController)
        sharpNavigationController.navigationBar.isHidden = true
        
        let shopViewController = ShopViewController()
        let shopNavigationController = UINavigationController(rootViewController: shopViewController)
        shopNavigationController.navigationBar.isHidden = true
        
        let moreViewController = MoreViewController()
        let moreNavigationController = UINavigationController(rootViewController: moreViewController)
        moreNavigationController.navigationBar.isHidden = true
        
        
        let viewControllers = [
            friendNavigationController,
            chatNavigationController,
            sharpNavigationController,
            shopNavigationController,
            moreNavigationController
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        
        let imageNames = [
            "iconTabPersonUnfilled",
            "iconTabChatUnfilled",
            "iconTabSharpUnfilled",
            "iconTabShopUnfilled",
            "iconTabMoreUnfilled"
        ]
        
        let imageSelectedNames = [
            "iconTabPersonfilled",
            "iconTabChatfilled",
            "iconTabSharpUnfilled",
            "iconTabShopUnfilled",
            "iconTabMoreUnfilled"
        ]
        
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(named: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
        }
    }
}

class MoreViewController : UIViewController {}
class ShopViewController : UIViewController {}
class SharpViewController : UIViewController {}

