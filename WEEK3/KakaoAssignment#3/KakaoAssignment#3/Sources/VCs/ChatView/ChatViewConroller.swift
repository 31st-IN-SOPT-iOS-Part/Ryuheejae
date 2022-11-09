import UIKit

import SnapKit
import SwiftyColor
import Then

class ChatCollectionViewController: BaseViewController {
    
    
    // MARK: - funcView
    let funcView: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    // MARK: - chatLabel
    let chatLabel: UILabel =  {
        let label  = UILabel()
        label.text = I18N.Chat.chatLabel
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // MARK: - openChatLabel
    let openChatLabel: UILabel =  {
        let label  = UILabel()
        label.text = I18N.Chat.openChatLabel
        label.textColor = 0xA6A6A6.color
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // MARK: - plusIcon
    let plusIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusIcon"), for: .normal)
        button.addTarget(self, action: #selector(touchupPlusButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - settingIcon
    let settingIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settingIcon"), for: .normal)
        return button
    }()
    
    // MARK: - userPoster
    let userPoster: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userPoster")
        return imageView
    }()
    
    // MARK: - chatCollectionView
    lazy var chatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    
    // MARK: - presentToPhotoVC func
    private func presentToPhotoVC(){
        let PhotoCollectionVC = PhotoCollectionViewController()
        PhotoCollectionVC.modalPresentationStyle = .fullScreen
        self.present(PhotoCollectionVC,animated: true,completion: nil)
    }
    
    // MARK: - objc touchupSignUpButton func
    @objc
    private func touchupPlusButton(){
        presentToPhotoVC()
    }
    
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
    }
}







