import UIKit
import SnapKit

// MARK: - ProfileViewController class
class ProfileViewController : UIViewController {
    
    // MARK: - xButton
    private let xButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(touchXButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - profileImg
    private let profileImg : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "profileImg")
        return imgView
    }()
    
    // MARK: - profileName
    private let profileName : UILabel = {
        let label = UILabel()
        label.text = "류희재"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - profileLine
    private let profileLine : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // MARK: - funcView
    private let funcView = UIView()
    
    // MARK: - chatMyselfButton
    private let chatMyselfButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileTalk"), for: .normal)
        return button
    }()
    
    // MARK: - chatMyselfLabel
    private let chatMyselfLabel : UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - editProfileButton
    private let editProfileButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileEdit"), for: .normal)
        return button
    }()
    
    // MARK: - editProfileLabel
    private let editProfileLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - kakaoStoryButton
    private let kakaoStoryButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakaostory"), for: .normal)
        return button
    }()
    
    // MARK: - kakaoStoryLabel
    private let kakaoStoryLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackgroundColor()
        layout()
    }
    
    // MARK: - touchXButton func
    @objc
    private func touchXButton() {
        if(self.navigationController == nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

// MARK: - ProfileViewController extension
extension ProfileViewController {
    
    // MARK: - layout func
    private func layout() {
        [xButton,profileImg,profileName,profileLine,funcView].forEach{
            view.addSubview($0)
        }
        
        [chatMyselfButton,chatMyselfLabel,editProfileButton,editProfileLabel,kakaoStoryButton,kakaoStoryLabel].forEach{
            funcView.addSubview($0)
        }
        
        // MARK: - xButton AutoLayout
        xButton.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        // MARK: - profileImg AutoLayout
        profileImg.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(470)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(139)
            make.width.equalTo(97)
            make.height.equalTo(96)
        }
        
        // MARK: - profileName AutoLayout
        profileName.snp.makeConstraints{ make in
            make.top.equalTo(self.profileImg.snp.bottom).offset(8)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(164)
        }
        
        // MARK: - profileLine AutoLayout
        profileLine.snp.makeConstraints{ make in
            make.top.equalTo(self.profileName.snp.bottom).offset(42)
            make.width.equalTo(375)
            make.height.equalTo(1)
        }
        
        // MARK: - funcView AutoLayout
        funcView.snp.makeConstraints{ make in
            make.top.equalTo(self.profileLine.snp.bottom).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(44)
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        
        // MARK: - chatMyselfButton AutoLayout
        chatMyselfButton.snp.makeConstraints{ make in
            make.top.equalTo(self.funcView).offset(24)
            make.leading.equalTo(self.funcView).offset(39)
            make.width.equalTo(19)
            make.height.equalTo(18)
        }
        
        // MARK: - chatMyselfLabel AutoLayout
        chatMyselfLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.chatMyselfButton.snp.bottom).offset(8)
            make.leading.equalTo(self.funcView).offset(20)
        }
        
        // MARK: - editProfileButton AutoLayout
        editProfileButton.snp.makeConstraints{ make in
            make.top.equalTo(self.funcView).offset(21)
            make.leading.equalTo(self.funcView).offset(135)
            make.width.equalTo(18)
            make.height.equalTo(19)
        }
        
        // MARK: - editProfileLabel AutoLayout
        editProfileLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.editProfileButton.snp.bottom).offset(9)
            make.leading.equalTo(self.funcView).offset(116)
        }
        
        // MARK: - kakaoStoryButton AutoLayout
        kakaoStoryButton.snp.makeConstraints{make in
            make.top.equalTo(self.funcView).offset(22)
            make.leading.equalTo(self.funcView).offset(231)
            make.width.equalTo(18)
            make.height.equalTo(21)
        }
        
        // MARK: - kakaoStoryLabel AutoLayout
        kakaoStoryLabel.snp.makeConstraints{make in
            make.top.equalTo(self.kakaoStoryButton.snp.bottom).offset(6)
            make.leading.equalTo(self.funcView).offset(212)
        }
    }
    
    // MARK: - setViewBackgroundColor func
    private func setViewBackgroundColor() {
        view.backgroundColor = .systemGray
    }
}
