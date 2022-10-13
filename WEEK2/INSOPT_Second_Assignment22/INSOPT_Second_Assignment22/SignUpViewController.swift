import UIKit
import SnapKit
extension SignUpViewController {
    private func layout(){
        [startLabel,emailTextField,emailLine,passwordTextField,passwordLine,signUpButton,checkPasswordLine,checkPasswordTextField].forEach{
            view.addSubview($0)
        }
        
        startLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
        }
        
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.startLabel).offset(119)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        
        emailLine.snp.makeConstraints{ make in
            make.top.equalTo(self.emailTextField.snp.bottom)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailLine).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        
        passwordLine.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField.snp.bottom)
            make.leading.equalTo(self.passwordTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        checkPasswordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordLine).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
            
        }
        
        checkPasswordLine.snp.makeConstraints{ make in
            make.top.equalTo(self.checkPasswordTextField.snp.bottom)
            make.leading.equalTo(self.checkPasswordTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
            
        }
        
        signUpButton.snp.makeConstraints{ make in
            make.top.equalTo(self.checkPasswordLine.snp.bottom).offset(26)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
    }
}
class SignUpViewController: UIViewController {
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField  = UITextField()
        textField.textColor = UIColor.black
        textField.borderStyle = .none
        textField.placeholder = "이메일 또는 전화번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    private let emailLine : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
    }()
    
    private let passwordTextField: UITextField = {
        let textField  = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.black
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    private let passwordLine : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
    }()
    
    private let checkPasswordTextField: UITextField = {
        let textField  = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.black
        textField.placeholder = "비밀번호 확인"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    private let checkPasswordLine : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignUpButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    
    private func presentToWelcomeVC(){
        let WelcomeVC = WelcomeViewController()
        WelcomeVC.modalPresentationStyle = .formSheet
        self.present(WelcomeVC,animated: true,completion: nil)
        if let email = emailTextField.text{
            WelcomeVC.dataBind(result:email)
        }
    }
    
    
    @objc
    private func touchupSignUpButton(){
        presentToWelcomeVC()
    }
    
    
}
