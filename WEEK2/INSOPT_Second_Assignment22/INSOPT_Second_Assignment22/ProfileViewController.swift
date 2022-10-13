import UIKit
import SnapKit
extension ProfileViewController {
    private func layout() {
        [xButton,profileImg,profileName,profileLine,funcView].forEach{
            view.addSubview($0)
        }
        
        [chatMyselfButton,chatMyselfLabel,editProfileButton,editProfileLabel,kakaoStoryButton,kakaoStoryLabel].forEach{
            funcView.addSubview($0)
        }
        
        xButton.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        profileImg.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(470)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(139)
            make.width.equalTo(97)
            make.height.equalTo(96)
        }
        
        profileName.snp.makeConstraints{ make in
            make.top.equalTo(self.profileImg.snp.bottom).offset(8)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(164)
        }
        profileLine.snp.makeConstraints{ make in
            make.top.equalTo(self.profileName.snp.bottom).offset(42)
            make.width.equalTo(375)
            make.height.equalTo(1)
        }
        
        funcView.snp.makeConstraints{ make in
            make.top.equalTo(self.profileLine.snp.bottom).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(44)
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        chatMyselfButton.snp.makeConstraints{ make in
            make.top.equalTo(self.funcView).offset(24)
            make.leading.equalTo(self.funcView).offset(39)
            make.width.equalTo(19)
            make.height.equalTo(18)
        }
        chatMyselfLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.chatMyselfButton.snp.bottom).offset(8)
            make.leading.equalTo(self.funcView).offset(20)
        }
        editProfileButton.snp.makeConstraints{ make in
            make.top.equalTo(self.funcView).offset(21)
            make.leading.equalTo(self.funcView).offset(135)
            make.width.equalTo(18)
            make.height.equalTo(19)
        }
        editProfileLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.editProfileButton.snp.bottom).offset(9)
            make.leading.equalTo(self.funcView).offset(116)
        }
        kakaoStoryButton.snp.makeConstraints{make in
            make.top.equalTo(self.funcView).offset(22)
            make.leading.equalTo(self.funcView).offset(231)
            make.width.equalTo(18)
            make.height.equalTo(21)
        }
        kakaoStoryLabel.snp.makeConstraints{make in
            make.top.equalTo(self.kakaoStoryButton.snp.bottom).offset(6)
            make.leading.equalTo(self.funcView).offset(212)
        }
    }
}
class ProfileViewController : UIViewController {
    private let xButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(touchXButton), for: .touchUpInside)
        return button
    }()
    
    private let profileImg : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "profileImg")
        return imgView
    }()
    
    private let profileName : UILabel = {
        let label = UILabel()
        label.text = "류희재"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let profileLine : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let funcView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let chatMyselfButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileTalk"), for: .normal)
        return button
    }()
    
    private let chatMyselfLabel : UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let editProfileButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileEdit"), for: .normal)
        return button
    }()
    
    private let editProfileLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let kakaoStoryButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakaostory"), for: .normal)
        return button
    }()
    
    private let kakaoStoryLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        layout()
    }
    
    @objc
    private func touchXButton() {
        if(self.navigationController == nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
