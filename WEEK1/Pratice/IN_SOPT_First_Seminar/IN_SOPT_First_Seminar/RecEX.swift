import UIKit

class RecEX : UIViewController {
    
    private let view1:UIView = {
        let first = UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 500))
        first.backgroundColor = .green
        return first
    }()
    
    
    private let view2: UIView = {
        let second = UIView(frame: CGRect(x:72, y: 130, width: 200, height: 400))
        second.backgroundColor = .red
        return second
    }()
    
    private let view3: UIView = {
        let third = UIView(frame: CGRect(x: 98, y: 236, width: 150, height:150))
        third.backgroundColor = .yellow
        return third
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        
        
    }
}

