import UIKit
import SnapKit

// MARK: - WelcomeViewController class
class WelcomeViewController: UIViewController {
    
    // MARK: - nameLabel
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "OOO님\n환영합니다"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - checkButton
    private lazy var checkButton : UIButton = {
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
        setViewBackgroundColor()
        layout()
    }
    
    // MARK: - dataBind func
    func dataBind(){
        guard let result = self.result else {return}
        nameLabel.text = "\(result)님\n환영합니다"
    }
    
    func dataBind(result:String){
        nameLabel.text = "\(result)님\n환영합니다"
    }
    
    // MARK: - presentToFriendTabViewController func
    // 2주차 생각과제 : https://duwjdtn11.tistory.com/523
    private func presentToFriendTabViewController() {
        let FriendVC = FriendTabViewController() // 루트 뷰를 대체할 FriendTabViewController() 생성
        FriendVC.modalPresentationStyle = .fullScreen
        let sceneDeligate = UIApplication.shared.connectedScenes.first?.delegate as!SceneDelegate
        sceneDeligate.window?.rootViewController = UINavigationController(rootViewController: FriendVC)
    }
    
    // MARK: - @objc touchupNextButton func
    @objc
    private func touchupNextButton() {
        presentToFriendTabViewController()
    }
}

// MARK: - WelcomeViewController extension
extension WelcomeViewController {
    
    // MARK: - layout func
    private func layout(){
        [nameLabel,checkButton].forEach{
            view.addSubview($0)
        }
        
        // MARK: - nameLabel AutoLayout
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(144)
        }
        
        // MARK: - checkButton AutoLayout
        checkButton.snp.makeConstraints{ make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(117)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
    }
    
    // MARK: - setViewBackgroundColor func
    private func setViewBackgroundColor() {
        view.backgroundColor = .white
    }
}
    
    

