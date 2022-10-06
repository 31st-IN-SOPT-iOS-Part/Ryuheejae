//
//  FirstViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 류희재 on 2022/10/01.
//

import UIKit

class FirstViewController:UIViewController {
    let questionLabel: UILabel={
        let label = UILabel(frame: CGRect(x:80,y:200,width:250,height:30))
        label.text = "민초vs반민초 당신의 선택은?"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let answerTextFeild:UITextField={
        let textField = UITextField(frame: CGRect(x:80,y:280,width:250,height:40))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = .systemFont(ofSize: 18, weight: .medium)
        return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x:80,y:350,width:250,height:42))
        button.setTitle("다음으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components:[Any] = [questionLabel,answerTextFeild,nextButton]
        components.forEach{
            view.addSubview($0 as! UIView) //UIview만 추가할 수 있또록 하는 코드
        }
    }
    
    
    func presentToSecondVC() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .formSheet
        
//        if let answer = answerTextFeild.text{
//            secondVC.dataBind()
//            //secondVC.dataBind(result: answer)
//        }
        
        self.present(secondVC,animated: true, completion: nil)
    }
    
    func pushToSecondVC() {
        let secondVC = SecondViewController()
//
//        if let answer = answerTextFeild.text {
//            secondVC.dataBind(result: answer)
//        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc //objc함수와 호환하는 키워드
    func touchupNextButton() {
        //presentToSecondVC() //프레센트를 하고 푸쉬하는것은 불가능하다!
        pushToSecondVC()
    }
}

