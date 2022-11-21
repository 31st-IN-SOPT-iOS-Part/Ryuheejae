import Foundation

//
//  SignupViewController.swift
//  INSOPT_SEMINAR
//
//  Created by hansol on 2022/11/05.
//

import UIKit

import Moya
import SnapKit
import SwiftyColor
import Then

// MARK: - SignupViewController

final class SignupViewController: UIViewController {
    
    
    
    // 로깅을 찍기 위한 함수
    // moya는 타겟을 만들어서 moyaprovider로 통신
    let userProvider = MoyaProvider<UserRouter>(
        plugins: [NetworkLoggerPlugin(verbose: true)]
    )
    
    private func pushToLogin() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    // MARK: - Action Helpers
    
    @objc
    private func touchupSubmitButton() {
        // 모든 항목에 값이 있따면~
        if let email = emailView.popInput(),
           let name = nameView.popInput(),
           let password = passwordView.popInput() {
            // 파라미터를 회원가입 요청 모델로 만들어주고
            let param = SignupRequestDto(email: email, name: name, password: password)
            // signup 함수에 대입
            signup(param: param)
        }
        
    }
    
    // MARK: - Network Helpers
    
    private func signup(param: SignupRequestDto) {
        userProvider.request(.signup(param: param)) { response in
            switch response {
            // 응답이 오면
            case .success(let result):
                // 응답의 status 코드를 보여주고
                let status = result.statusCode
                // 응답의 status 코드가 성공이면 로그인 창으로 간다
                if status >= 200 && status < 300 {
                    self.pushToLogin()
                }
                else if status >= 400 {}
            // 응답이 안오면 에러 프린트
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
    }
    
    
    
    
    
    
    // MARK: - UI Components
    
    private let emailView = InputView()
    private let nameView = InputView()
    private let passwordView = InputView()
    private lazy var submitButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(touchupSubmitButton), for: .touchUpInside)
    }
    
    // MARK: - Variables
    
    let titles = ["이메일", "이름", "비밀번호"]
    let placeholders = ["이메일을 입력하세요", "이름을 입력하세요", "비밀번호를 입력하세요"]
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        layout()
    }
}

// MARK: - Extensions

extension SignupViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [emailView, nameView, passwordView, submitButton].forEach {
            view.addSubview($0)
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.height.equalTo(52)
        }
        
        nameView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(emailView)
            $0.height.equalTo(52)
        }
        
        passwordView.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(nameView)
            $0.height.equalTo(52)
        }
        
        submitButton.snp.makeConstraints {
            $0.top.equalTo(passwordView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(nameView)
            $0.height.equalTo(48)
        }
    }
    
    // MARK: - General Helpers
    
    private func config() {
        emailView.config(title: titles[0], placeholder: placeholders[0])
        nameView.config(title: titles[1], placeholder: placeholders[1])
        passwordView.config(title: titles[2], placeholder: placeholders[2])
    }
    
    
    
    // MARK: - Action Helpers
    
    
    // MARK: - Network Helpers
    
}


// MARK: - Enviroment

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: "", with: "")
}





// MARK: - Encodable Extension

extension Encodable {
    
    func asParameter() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                as? [String: Any] else {
            throw NSError()
        }
        
        return dictionary
    }
}
