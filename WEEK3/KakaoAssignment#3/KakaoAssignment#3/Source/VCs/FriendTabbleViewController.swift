import UIKit
import SnapKit

// MARK: - FriendTabViewController class
class FriendTabbleViewController : UIViewController {
    
    // MARK: - friendView
    private let friendView : UIView =  {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - friendTableView
    private lazy var friendTableView : UITableView =  {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var friendList: [FriendModel] = [
        FriendModel(name: "김솝트", profileMessage: "햄볶아요", profileImage: "Image"),
        FriendModel(name: "안솝트", profileMessage: "귀여아요", profileImage: "Image 1"),
        FriendModel(name: "최솝트", profileMessage: "킹받아요", profileImage: "Image 2"),
        FriendModel(name: "정솝트", profileMessage: "들어아요", profileImage: "Image 3"),
        FriendModel(name: "강솝트", profileMessage: "작아요", profileImage: "Image 4"),
        FriendModel(name: "오솝트", profileMessage: "자가용", profileImage: "Image 5"),
        FriendModel(name: "황솝트", profileMessage: "암요암요", profileImage: "Image 6"),
        FriendModel(name: "최솝트", profileMessage: "힘내봐아요", profileImage: "Image 7"),
        FriendModel(name: "고솝트", profileMessage: "잘지내봐요", profileImage: "Image 7"),
        FriendModel(name: "류솝트", profileMessage: "보고파요", profileImage: "Image 7"),
        FriendModel(name: "성솝트", profileMessage: "난 이제 지쳤어요 땡벌땡벌", profileImage: "Image 7"),
        FriendModel(name: "진솝트", profileMessage: "월클되아요", profileImage: "Image 7"),
    
    ]
    
    // MARK: - friendLabel
    private let friendLabel : UILabel =  {
        let label  = UILabel()
        label.text = "친구"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // MARK: - settingIcon
    private let settingIcon : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "settingIcon")
        return imgView
    }()
    
    // MARK: - profileButton
    private let profileButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchUpProfileButton), for: .touchUpInside)
        button.setImage(UIImage(named: "profileImg"), for: .normal)
        return button
    }()
    
    // MARK: - profileName
    private let profileName = UILabel().then {
        $0.text = "김솝트"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    // MARK: - profileMessage
    private let profileMessage = UILabel().then {
        $0.text = "상태메세지는 여기에"
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackgroundColor()
        layout()
        register()
    }
    
    // MARK: - presentToProfileViewController func
    private func presentToProfileViewController(){
        let ProfileVC = ProfileViewController()
        ProfileVC.modalPresentationStyle = .formSheet
        self.present(ProfileVC,animated: true,completion: nil)
    }
    
    // MARK: - @objc touchUpProfileButton func
    @objc
    private func touchUpProfileButton() {
        presentToProfileViewController()
    }
}


// MARK: - FriendTabViewController extension
extension FriendTabbleViewController {
    
    // MARK: - layout func
    private func layout() {
        [friendView, friendTableView, profileButton, profileName, profileMessage].forEach{
            view.addSubview($0)
        }
        
        [friendLabel,settingIcon].forEach{
            friendView.addSubview($0)
        }
        
        // MARK: - friendView AutoLayout
        friendView.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(-3)
            make.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(375)
            make.height.equalTo(52)
        }
        
        // MARK: - friendView AutoLayout
        friendTableView.snp.makeConstraints{ make in
            make.top.equalTo(self.profileButton.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(70 * friendList.count)
        }
        
        // MARK: - friendLabel AutoLayout
        friendLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalToSuperview().offset(14)
        }
        
        // MARK: - settingIcon AutoLayout
        settingIcon.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(4)
            make.width.equalTo(21)
            make.height.equalTo(21)
        }
        
        // MARK: - profileButton AutoLayout
        profileButton.snp.makeConstraints{ make in
            make.top.equalTo(self.friendView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }
        
        profileName.snp.makeConstraints { make in
            make.top.equalTo(self.profileButton).offset(10)
            make.leading.equalTo(self.profileButton.snp.trailing).offset(3)
        }
 
        profileMessage.snp.makeConstraints { make in
            make.top.equalTo(self.profileName.snp.bottom).offset(3)
            make.leading.equalTo(self.profileName)
        }
    }
    
    // MARK: - General Helpers
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
    
    // MARK: - setViewBackgroundColor func
    private func setViewBackgroundColor() {
        view.backgroundColor = .white
    }
    
}

extension FriendTabbleViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


// MARK: - UITableViewDataSource
extension FriendTabbleViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = friendTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else {return UITableViewCell()}
        
        friendCell.dataBind(model : friendList[indexPath.row])
        return friendCell
    }
}



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
