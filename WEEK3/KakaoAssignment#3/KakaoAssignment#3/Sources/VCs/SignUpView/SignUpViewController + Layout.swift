// MARK: - SignUpViewController extension
extension SignUpViewController {

    // MARK: - layout func
    func layout(){
        [startLabel,emailTextField,emailLine,passwordTextField,passwordLine,signUpButton,checkPasswordLine,checkPasswordTextField].forEach{
            view.addSubview($0)
        }
        
        // MARK: - startLabel AutoLayout
        startLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
        }
        
        // MARK: - emailTextField AutoLayout
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.startLabel).offset(119)
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
        
        // MARK: - passwordTextField AutoLayout
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailLine).offset(10)
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
        
        // MARK: - checkPasswordTextField AutoLayout
        checkPasswordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordLine).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
            
        }
        
        // MARK: - checkPasswordLine AutoLayout
        checkPasswordLine.snp.makeConstraints{ make in
            make.top.equalTo(self.checkPasswordTextField.snp.bottom)
            make.leading.equalTo(self.checkPasswordTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
            
        }
        
        // MARK: - signUpButton AutoLayout
        signUpButton.snp.makeConstraints{ make in
            make.top.equalTo(self.checkPasswordLine.snp.bottom).offset(26)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
    }
    
    // MARK: - setViewBackgroundColor func
    func setViewBackgroundColor() {
        view.backgroundColor = .white
    }
}
