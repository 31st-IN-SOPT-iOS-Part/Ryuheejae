import UIKit
import SnapKit

// MARK: - FriendTabViewController class
class FriendTabbleViewController: UIViewController {
    
    // MARK: - friendView
    let friendView : UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - friendTableView
    lazy var friendTableView: UITableView =  {
        let tableView = UITableView(frame: .zero, style: .grouped)
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
    
    
    
    // MARK: - friendLabel
    let friendLabel: UILabel =  {
        let label  = UILabel()
        label.text = "친구"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // MARK: - settingIcon
    let settingIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "settingIcon")
        return imgView
    }()
    
    //    // MARK: - profileButton
    //    private let profileButton : UIButton = {
    //        let button = UIButton()
    //        button.addTarget(self, action: #selector(touchUpProfileButton), for: .touchUpInside)
    //        button.setImage(UIImage(named: "profileImg"), for: .normal)
    //        return button
    //    }()
    //
    //    // MARK: - profileName
    //    private let profileName = UILabel().then {
    //        $0.text = "김솝트"
    //        $0.textColor = .black
    //        $0.font = .systemFont(ofSize: 12, weight: .medium)
    //    }
    //
    //    // MARK: - profileMessage
    //    private let profileMessage = UILabel().then {
    //        $0.text = "상태메세지는 여기에"
    //        $0.textColor = 0xA6A6A6.color
    //        $0.font = .systemFont(ofSize: 11, weight: .medium)
    //    }
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        //config()
        layout()
        register()
    }
    
    //    // MARK: - presentToProfileViewController func
    //    private func presentToProfileViewController(){
    //        let ProfileVC = ProfileViewController()
    //        ProfileVC.modalPresentationStyle = .formSheet
    //        self.present(ProfileVC,animated: true,completion: nil)
    //    }
    //
    //    // MARK: - @objc touchUpProfileButton func
    //    @objc
    //    private func touchUpProfileButton() {
    //        presentToProfileViewController()
    //    }
}




//    // MARK: - setViewBackgroundColor func
//    private func config() {
//        view.backgroundColor = .white
//    }
// }






