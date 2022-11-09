import UIKit
import SnapKit

// MARK: - SignUpViewController class
class SignUpViewController: BaseViewController {
    
    // MARK: - startLabel
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - emailTextField
    let emailTextField: UITextField = {
        let textField  = UITextField()
        textField.textColor = UIColor.black
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
    
    // MARK: - passwordTextField
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
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
    }()
    
    // MARK: - checkPasswordTextField
    let checkPasswordTextField: UITextField = {
        let textField  = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.black
        textField.placeholder = "비밀번호 확인"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    // MARK: - checkPasswordLine
    let checkPasswordLine: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4 //#a09fa0
        return line
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
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    // MARK: - presentToWelcomeVC func
    func presentToWelcomeVC(){
        let WelcomeVC = WelcomeViewController()
        
        if let email = emailTextField.text{ WelcomeVC.dataBind(result:email) }
        
        WelcomeVC.modalPresentationStyle = .formSheet
        self.present(WelcomeVC,animated: true,completion: nil)
        
    }
    
    // MARK: - objc touchupSignUpButton func
    @objc
    private func touchupSignUpButton(){
        let alert = UIAlertController(title: "Alert", message:
                                        "AlertController", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "네", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        presentToWelcomeVC()
    }
}

