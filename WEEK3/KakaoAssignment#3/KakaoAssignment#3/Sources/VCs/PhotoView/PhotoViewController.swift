import UIKit

import SnapKit
import SwiftyColor
import Then

class PhotoCollectionViewController: BaseViewController {
    
    
    // MARK: - topBarView
    let topBarView = UIView()
    public var selectedImageList: [Int] = []
    
    // MARK: - xButton
    let closeButton = UIButton().then {
        $0.setImage(UIImage(named: "closeBtnBlack"), for: .normal)
        $0.addTarget(self, action: #selector(touchXButton), for: .touchUpInside)
    }
    
    // MARK: - recentFileLabel
    let recentFileLabel = UILabel().then {
        $0.text = I18N.Photo.recentFileLabel
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        
    }
    
    // MARK: - sendButton
    let sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(UIColor .black, for: .normal)
        // $0.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    // MARK: - PhotoCollectionView
    lazy var PhotoCollectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - touchXButton func
    @objc
    private func touchXButton() {
        if(self.navigationController == nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
    }
    
}






