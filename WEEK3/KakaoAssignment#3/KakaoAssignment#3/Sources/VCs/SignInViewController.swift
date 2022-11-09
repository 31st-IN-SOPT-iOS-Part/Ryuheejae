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
        
        if (emailTextField.text == "") {
            showToast(message: "아이드를 입력해주세요", font: .systemFont(ofSize: 10))
        } else if (passwordTextField.text == "") {
            showToast(message: "비밀번호를 입력해주세요", font: .systemFont(ofSize: 10))
        } else {
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
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
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

