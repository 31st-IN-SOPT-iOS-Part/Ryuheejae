import SnapKit
import UIKit

// MARK: - SignInViewController class
class SignInViewController : BaseViewController {
    
    // MARK: - startLabel
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.authTitle
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - describeLabel
    let describeLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.loginDescription
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.textColor = .systemGray //color - 7d7e7d
        label.numberOfLines = 2;
        return label
    }()
    
    // MARK: - emailTextfield
    let emailTextField: UITextField = {
        let textField  = UITextField()
        textField.textColor = UIColor.loginGrayText
        textField.borderStyle = .none
        textField.placeholder = I18N.Auth.idTextFieldPlaceholder
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
        textField.placeholder = I18N.Auth.passwordTextFieldPlaceholder
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
        button.setTitle(I18N.Auth.loginButton, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignInButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - signUpButton
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.signupButton, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignUpButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - findButton
    let findButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.findLabel, for: .normal)
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
        layout()
    }
    
    // MARK: - presentToWelcomeVC func
    func presentToWelcomeVC(){
        let WelcomeVC = WelcomeViewController()
        
        if (isValidEmail(email: emailTextField.text ?? "") && isValidPassword(password: passwordTextField.text ?? "")) {
            if let email = emailTextField.text{ WelcomeVC.dataBind(result:email) }
            WelcomeVC.modalPresentationStyle = .formSheet
            self.present(WelcomeVC,animated: true,completion: nil)
        }
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

