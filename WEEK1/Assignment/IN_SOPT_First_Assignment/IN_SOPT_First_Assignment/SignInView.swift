//
//  ViewController.swift
//  IN_SOPT_First_Assignment
//
//  Created by 류희재 on 2022/10/05.
//
import UIKit

class SignInView: UIViewController {

    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width/2-125, y: 50, width: 250, height: 200))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    private let describeLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width/2-125, y: 70, width: 250, height: 250))
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요"
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.numberOfLines = 2;
        return label
    }()
    
    private let emailTextfield: UITextField = {
       let textField  = UITextField(frame: CGRect(x: 10, y: 300, width: UIScreen.main.bounds.size.width, height: 100))
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-17,
                              width: textField.frame.width, height: 1)
        border.backgroundColor = UIColor.systemGray4.cgColor
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.black
        textField.borderStyle = .none
        textField.placeholder = "이메일 또는 전화번호"
        textField.font = .systemFont(ofSize: 17)
        
        return textField
    }()

    private let passwordTextfield: UITextField = {
       let textField  = UITextField(frame: CGRect(x: 10, y: 350, width: UIScreen.main.bounds.size.width, height: 100))
        textField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-17,
                              width: textField.frame.width, height: 1)
        border.backgroundColor = UIColor.systemGray4.cgColor
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.black
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()

    private let signInButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 470, width: UIScreen.main.bounds.size.width - 40, height: 50))
        button.setTitle("카카오계정으로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignInButton), for: .touchUpInside)
        return button
    }()
    
    
    private let signUpButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 530, width: UIScreen.main.bounds.size.width - 40, height: 50))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupSignUpButton), for: .touchUpInside)
        return button
    }()
    
    private let findButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 590, width: UIScreen.main.bounds.size.width - 40, height: 50))
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .white
        return button
    }()
    
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let components:[Any] = [startLabel,describeLabel,emailTextfield,passwordTextfield,signInButton,signUpButton,findButton]
        
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }

    private func presentToThirdVC(){
        let thirdVC = WelcomeView()
        
        thirdVC.modalPresentationStyle = .formSheet
        self.present(thirdVC,animated: true,completion: nil)
        
        if let email = emailTextfield.text{
            thirdVC.dataBind(result:email)
        }
    }
    
    private func pushToSecondVC() {
        let secondVC = SignUpView()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupSignInButton() {
        presentToThirdVC()
    }
    
    @objc
    private func touchupSignUpButton(){
        pushToSecondVC()
    }
}
