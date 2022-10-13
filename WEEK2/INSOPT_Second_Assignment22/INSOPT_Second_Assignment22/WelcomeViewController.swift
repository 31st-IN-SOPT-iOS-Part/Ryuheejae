import UIKit
extension WelcomeViewController {
    private func layout(){
        [nameLabel,checkButton].forEach{
            view.addSubview($0)
        }
        
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(144)
        }
        
        checkButton.snp.makeConstraints{ make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(117)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
    }
}

class WelcomeViewController: UIViewController {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "OOO님\n환영합니다"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    var result: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func dataBind(){
        guard let result = self.result else {return}
        nameLabel.text = "\(result)님\n환영합니다"
    }
    
    func dataBind(result:String){
        nameLabel.text = "\(result)님\n환영합니다"
    }
    
    private func presentToFriendTabViewController() {
        let FriendVC = FriendTabViewController()
        FriendVC.modalPresentationStyle = .formSheet
        self.present(FriendVC,animated: true,completion: nil)
    }
    
    @objc
    private func touchupNextButton() {
        presentToFriendTabViewController()
    }
    
    
}
