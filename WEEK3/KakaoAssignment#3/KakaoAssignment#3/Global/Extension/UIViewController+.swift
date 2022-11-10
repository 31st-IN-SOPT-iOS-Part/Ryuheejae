import UIKit

extension UIViewController {
    func showToast(message : String, font : UIFont) {
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
    
    
    func isValidEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //NSPredicate :  메모리 내에서 어떤 값을 가져올때 filter에 대한 조건
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if(email == ""){
            showToast(message: "이메일을 입력해주세요.", font: .systemFont(ofSize: 10))
            return false
        } else if(!emailTest.evaluate(with: email)){
            showToast(message: "올바른 이메일 형식이 아닙니다.", font: .systemFont(ofSize: 10))
            return false
        }
        return true
    }
    
    func isValidPassword(password : String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 8자리 ~ 50자리 영어+숫자+특수문자
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        if(password == ""){
            showToast(message: "비밀번호를 입력해주세요.", font: .systemFont(ofSize: 10))
            return false
        } else if(!passwordTest.evaluate(with: password)){
            showToast(message: "올바른 비밀번호 형식이 아닙니다.", font: .systemFont(ofSize: 10))
            return false
        }
        return true
        
    }
    
    func isValidCheckPassword(password : String, checkingPassword : String) -> Bool {
        if(password != checkingPassword){
            showToast(message: "입력된 비밀번호와 일치하지 않습니다.", font: .systemFont(ofSize: 10))
            return false
        }
        return true
    }
    
    
}
