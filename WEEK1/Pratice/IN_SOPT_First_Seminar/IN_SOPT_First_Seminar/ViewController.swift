//
//  ViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 류희재 on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {
    
    private let testLable:UILabel = {
        let label = UILabel(frame: CGRect(x:150,y:400,width:40,height:40))
        label.text = "아요미들🍎"
        label.textColor = .white
        // label.font = .boldSystemFont(ofSize: 40)
        // label.numberOfLines : 라인수
        return label
    }()
    
    private let testButton:UIButton = {
        let button = UIButton(frame: CGRect(x:150,y:600,width:40,height:40))
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black //UIColor.white
        view.addSubview(testLable)
    }
    
    
}

