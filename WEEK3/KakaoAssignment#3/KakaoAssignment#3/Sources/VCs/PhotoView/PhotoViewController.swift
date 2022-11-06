import UIKit

import SnapKit
import SwiftyColor
import Then

class PhotoCollectionViewController: UIViewController {
    
    // MARK: - topBarView
    let topBarView = UIView()
    var photos = [UIImage]() // 사진을 담을 배열
    var photoarray = [Int]() // 몇 번째 인덱스가 선택되었는지 담을 배열
    
    // MARK: - xButton
    let closeButton = UIButton().then {
        $0.setImage(UIImage(named: "closeBtnBlack"), for: .normal)
        $0.addTarget(self, action: #selector(touchXButton), for: .touchUpInside)
    }
    
    // MARK: - recentFileLabel
    let recentFileLabel = UILabel().then {
        $0.text = "최근 항목"
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
    
    
    // MARK: - Constants
    final let photoInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
    final let photoLineSpacing: CGFloat = 3
    final let photoInterItemSpacing: CGFloat = 5
    final let photoCellHeight: CGFloat = 119
    
    
    
    
    
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






