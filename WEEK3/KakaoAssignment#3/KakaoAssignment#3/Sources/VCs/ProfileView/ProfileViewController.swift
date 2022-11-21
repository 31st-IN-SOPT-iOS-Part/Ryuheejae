import UIKit
import SnapKit

// MARK: - ProfileViewController class
class ProfileViewController: UIViewController {
    var profileName: String?
    var profileImage: String?
    
    lazy var containerView: UIView = UIView()
    
    // MARK: - xButton
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(touchXButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - profileImg
    let profileImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 20
        imgView.clipsToBounds = true
        return imgView
    }()
    
    // MARK: - profileName
    let profileNameLabel: UILabel = {
        let label = UILabel()
        //label.text = "류희재"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - profileLine
    let profileLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // MARK: - funcView
    let funcView = UIView()
    
    // MARK: - chatMyselfButton
    let chatMyselfButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileTalk"), for: .normal)
        return button
    }()
    
    // MARK: - chatMyselfLabel
    let chatMyselfLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Profile.chatMyselfLabel
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - editProfileButton
    let editProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileEdit"), for: .normal)
        return button
    }()
    
    // MARK: - editProfileLabel
    let editProfileLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Profile.editProfileLabel
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - kakaoStoryButton
    let kakaoStoryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakaostory"), for: .normal)
        return button
    }()
    
    // MARK: - kakaoStoryLabel
    let kakaoStoryLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Profile.kakaoStoryLabel
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    func dataBindProfile(profileName: String, profileImage: String) {
        profileNameLabel.text = profileName
        profileImgView.image = UIImage(named: profileImage)
    }
    
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
