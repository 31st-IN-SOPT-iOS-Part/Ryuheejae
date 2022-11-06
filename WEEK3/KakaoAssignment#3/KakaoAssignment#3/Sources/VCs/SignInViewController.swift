import SnapKit
import UIKit

// MARK: - SignInViewController class
class SignInViewController : UIViewController {

    // MARK: - startLabel
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - describeLabel
    let describeLabel: UILabel = {
       let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.textColor = .systemGray //color - 7d7e7d
        label.numberOfLines = 2;
        return label
    }()
    
    // MARK: - emailTextfield
    let emailTextField: UITextField = {
       let textField  = UITextField()
        textField.textColor = UIColor.black //#9f9e9f
        textField.borderStyle = .none
        textField.placeholder = "이메일 또는 전화번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    // MARK: - emailLine
    let emailLine: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
    }()

    // MARK: - passwordTextfield
    let passwordTextField: UITextField = {
       let textField  = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.black
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    // MARK: - passwordLine
    let passwordLine: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()

    // MARK: - signInButton
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정으로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignInButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - signUpButton
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignUpButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - findButton
    let findButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .white
        return button
    }()
    
    var result: String?
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // MARK: - presentToWelcomeVC func
    func presentToWelcomeVC(){
        let WelcomeVC = WelcomeViewController()
        
        if let email = emailTextField.text{ WelcomeVC.dataBind(result:email) }
        
        WelcomeVC.modalPresentationStyle = .formSheet
        self.present(WelcomeVC,animated: true,completion: nil)
    }
    
    // MARK: - pushToSignUpVC func
    func pushToSignUpVC() {
        let SignUpVC = SignUpViewController()
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
    // MARK: - @objc touchupSignInButton func
    @objc
    func touchupSignInButton() {
        presentToWelcomeVC()
    }
    
    // MARK: - @objc touchupSignUpButton func
    @objc
    func touchupSignUpButton(){
        pushToSignUpVC()
    }
}

