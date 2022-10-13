import UIKit
import SnapKit
extension FriendTabViewController {
    private func layout() {
        view.addSubview(scrollView)
        [friendView, profileButton].forEach{
            scrollView.addSubview($0)
        }
        
        [friendLabel,settingIcon].forEach{
            friendView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        friendView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(-3)
            make.leading.equalToSuperview()
            make.width.equalTo(375)
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(14)
        }
        
        settingIcon.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(4)
            make.width.equalTo(21)
            make.height.equalTo(21)
        }
        
        profileButton.snp.makeConstraints{ make in
            make.top.equalTo(self.friendView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }
    }
}
class FriendTabViewController : UIViewController {
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let friendView : UIView =  {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let friendLabel : UILabel =  {
        let label  = UILabel()
        label.text = "친구"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let settingIcon : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "settingIcon")
        return imgView
    }()
    
    private let profileButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchUpProfileButton), for: .touchUpInside)
        button.setImage(UIImage(named: "profileImg"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            layout()
    }
    
    private func presentToProfileViewController(){
        let ProfileVC = ProfileViewController()
        ProfileVC.modalPresentationStyle = .formSheet
        self.present(ProfileVC,animated: true,completion: nil)
    }
    
    @objc
    private func touchUpProfileButton() {
        presentToProfileViewController()
    }
}
