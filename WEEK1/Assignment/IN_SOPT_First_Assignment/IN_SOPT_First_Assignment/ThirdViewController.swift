import UIKit

class ThirdViewController: UIViewController {
    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width/2-125, y: 200, width: 250, height: 100))
        label.text = "OOO님"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    private let helloLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width/2-125, y: 250, width: 250, height: 100))
        label.text = "환영합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 530, width: UIScreen.main.bounds.size.width - 40, height: 50))
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    var result: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(helloLabel)
        view.addSubview(checkButton)
        
    }
    
    func dataBind(result:String){
        nameLabel.text = "\(result)님"
    }
    
    @objc
    private func touchupNextButton() {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
                
        if self.navigationController == nil{
            self.dismiss(animated: true) {
                presentingVC.popToRootViewController(animated: false)
        }
        }
    }
}
