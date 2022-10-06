//
//  SecondViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 류희재 on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController {
    let resultLabel: UILabel = {
        let label = UILabel(frame: CGRect(x:80, y:200,width:300,height:30))
        label.text = "당신의 선택은 이거였군요!"
        label.font = .systemFont(ofSize:24, weight: .bold)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x:150,y:260,width:80, height: 30))
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(resultLabel)
        view.addSubview(backButton)
    }
    
    
//    func dataBind() {
//        guard let result = self.result else {return}
//        resultLabel.text = "당신의 선택은\(result)였군요!"
//    }
    
    
//    //직접 파라미터로 전달
//    func dataBind(result:String){
//        resultLabel.text = "당신의 선택은\(result)였군요!"
//    }
    
    @objc //objc함수와 호환하는 키워드
    func touchupNextButton() {
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
