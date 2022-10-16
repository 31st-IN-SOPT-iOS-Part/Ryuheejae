import SnapKit
import UIKit

// MARK: - SignInViewController class
class SignInViewController : UIViewController {

    // MARK: - startLabel
    private let startLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - describeLabel
    private let describeLabel : UILabel = {
       let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.textColor = .systemGray //color - 7d7e7d
        label.numberOfLines = 2;
        return label
    }()
    
    // MARK: - emailTextfield
    private let emailTextField : UITextField = {
       let textField  = UITextField()
        textField.textColor = UIColor.black //#9f9e9f
        textField.borderStyle = .none
        textField.placeholder = "이메일 또는 전화번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    // MARK: - emailLine
    private let emailLine : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
    }()

    // MARK: - passwordTextfield
    private let passwordTextField : UITextField = {
       let textField  = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.black
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    // MARK: - passwordLine
    private let passwordLine : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()

    // MARK: - signInButton
    private let signInButton : UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정으로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignInButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - signUpButton
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignUpButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - findButton
    private let findButton : UIButton = {
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
    private func presentToWelcomeVC(){
        let WelcomeVC = WelcomeViewController()
        
        WelcomeVC.modalPresentationStyle = .formSheet
        self.present(WelcomeVC,animated: true,completion: nil)
        
        if let email = emailTextField.text{
            WelcomeVC.dataBind(result:email)
        }
    }
    
    // MARK: - pushToSignUpVC func
    private func pushToSignUpVC() {
        let SignUpVC = SignUpViewController()
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
    // MARK: - @objc touchupSignInButton func
    @objc
    private func touchupSignInButton() {
        presentToWelcomeVC()
    }
    
    // MARK: - @objc touchupSignUpButton func
    @objc
    private func touchupSignUpButton(){
        pushToSignUpVC()
    }
}

// MARK: - SignInViewController extension
extension SignInViewController {
    
    // MARK: - layout func
    private func layout(){
        [startLabel,describeLabel,emailTextField,emailLine, passwordTextField,passwordLine,signInButton,signUpButton,findButton].forEach{
            view.addSubview($0)
        }
        
        // MARK: - startLabel AutoLayout
        startLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
        }
        
        // MARK: - describeLabel AutoLayout
        describeLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.startLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(67)
        }
        
        // MARK: - emailTextfield AutoLayout
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.describeLabel.snp.bottom).offset(50)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        
        // MARK: - emailLine AutoLayout
        emailLine.snp.makeConstraints{ make in
            make.top.equalTo(self.emailTextField.snp.bottom)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        // MARK: - passwordTextfield AutoLayout
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        
        // MARK: - passwordLine AutoLayout
        passwordLine.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField.snp.bottom)
            make.leading.equalTo(self.passwordTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        // MARK: - signInButton AutoLayout
        signInButton.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(35)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
        // MARK: - signUpButton AutoLayout
        signUpButton.snp.makeConstraints{ make in
            make.top.equalTo(self.signInButton.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
        // MARK: - findButton AutoLayout
        findButton.snp.makeConstraints{ make in
            make.top.equalTo(self.signUpButton.snp.bottom).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(99)
        }
    }
    
    // MARK: - setViewBackgroundColor func
    private func setViewBackgroundColor() {
        view.backgroundColor = .white
    }
}
