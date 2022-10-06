import UIKit


class ViewController : UIViewController {
    
    private let changeButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 700, width: 200, height: 100))
        button.setTitle("Change Bounds Origin", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    
    private let view1:UIView = {
        let first = UIView(frame: CGRect(x: 72, y: 79, width: 300, height: 500))
        first.backgroundColor = .green
        return first
    }()
    
    
    private let view2: UIView = {
        let second = UIView(frame: CGRect(x:98, y: 157, width: 150, height: 250))
        second.backgroundColor = .red
        return second
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(changeButton)
        view.addSubview(view1)
        view1.addSubview(view2)
    }
                               
    
                                
    func chanegeBoundsOrigin() {
        if(view1.bounds.origin.x == 0 && view1.bounds.origin.y == 0){
            view1.bounds.origin.x = 98
            view1.bounds.origin.y = 157
        }else{
            view1.bounds.origin.x = 0
            view1.bounds.origin.y = 0
        }
    }
                               
    @objc //objc함수와 호환하는 키워드
    func touchupNextButton() {
        chanegeBoundsOrigin()
    }
    
    
}

