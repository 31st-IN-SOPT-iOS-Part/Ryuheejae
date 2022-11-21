import UIKit
import SnapKit

// MARK: - WelcomeViewController class
class WelcomeViewController: BaseViewController {
    
    lazy var containerView: UIScrollView = UIScrollView()
    
    // MARK: - nameLabel
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "OOO님\n환영합니다"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - checkButton
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    var result: String?
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    // MARK: - dataBind func
    func dataBind() {
        guard let result = self.result else {return}
        nameLabel.text = "\(result)님\n환영합니다"
    }
    
    func dataBind(result:String){
        nameLabel.text = "\(result)님\n환영합니다"
    }
    
    // MARK: - presentToFriendTabViewController func
    // 2주차 생각과제 : https://duwjdtn11.tistory.com/523
    func presentToFriendTabViewController() {
        let KakaoTabbarVC = KakaoTabbarController() // 루트 뷰를 대체할 FriendTabViewController() 생성
        KakaoTabbarVC.modalPresentationStyle = .fullScreen
        let sceneDeligate = UIApplication.shared.connectedScenes.first?.delegate as!SceneDelegate
        sceneDeligate.window?.rootViewController = KakaoTabbarVC
    }
    
    // MARK: - @objc touchupNextButton func
    @objc
    private func touchupNextButton() {
        presentToFriendTabViewController()
    }
}



    
    

