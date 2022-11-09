// MARK: - SignInViewController extension
extension SignInViewController {
    
    // MARK: - layout func
    func layout(){
        view.addSubviews(startLabel,describeLabel,emailTextField,emailLine, passwordTextField,passwordLine,signInButton,signUpButton,findButton)
        
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
