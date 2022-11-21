import UIKit
import SnapKit

// MARK: - FriendTabViewController class
class FriendTabbleViewController: BaseViewController {
    
    lazy var containerView: UIView = UIView()
    
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
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        //config()
        layout()
        register()
    }
}
