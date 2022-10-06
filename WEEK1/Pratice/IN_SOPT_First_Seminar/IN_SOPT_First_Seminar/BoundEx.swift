import UIKit


class BoundEX : UIViewController {
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
        view.addSubview(view1)
        print("frame origin: ", view1.frame.origin.x,view1.frame.origin.y)
        print("bounds origin: ",view1.bounds.origin.x,view1.bounds.origin.y)
        view1.bounds.origin.x = 98
        view1.bounds.origin.y = 157
        view1.addSubview(view2)
    }
}

