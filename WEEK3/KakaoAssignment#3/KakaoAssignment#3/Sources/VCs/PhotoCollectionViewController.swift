import UIKit

import SnapKit
import SwiftyColor
import Then

class PhotoCollectionViewController : UIViewController {
    
    // MARK: - topBarView
    private let topBarView = UIView()
    private var photos = [UIImage]() // 사진을 담을 배열
    private var photoarray = [Int]() // 몇 번째 인덱스가 선택되었는지 담을 배열
    
    // MARK: - xButton
    private let xButton = UIButton().then {
        $0.setImage(UIImage(named: "closeBtnBlack"), for: .normal)
        $0.addTarget(self, action: #selector(touchXButton), for: .touchUpInside)
    }
    
    // MARK: - recentFileLabel
    private let recentFileLabel = UILabel().then {
        $0.text = "최근 항목"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        
    }
    
    // MARK: - sendButton
    private let sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(UIColor .black, for: .normal)
        // $0.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    // MARK: - PhotoCollectionView
    private lazy var PhotoCollectionView : UICollectionView  = {
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
    
    // MARK: - Variables
    var photoList : [PhotoModel] = [
        PhotoModel(photoImage: "galleryImage_camera", number: 0),
        PhotoModel(photoImage: "galleryImage1", number: 1),
        PhotoModel(photoImage: "galleryImage2", number: 2),
        PhotoModel(photoImage: "galleryImage3", number: 3),
        PhotoModel(photoImage: "galleryImage4", number: 4),
        PhotoModel(photoImage: "galleryImage6", number: 5),
        PhotoModel(photoImage: "galleryImage7", number: 6),
        PhotoModel(photoImage: "galleryImage8", number: 7),
        PhotoModel(photoImage: "galleryImage9", number: 8),
        PhotoModel(photoImage: "galleryImage10", number: 9),
        PhotoModel(photoImage: "galleryImage11", number: 10),
        PhotoModel(photoImage: "galleryImage12", number: 11),
        PhotoModel(photoImage: "galleryImage13", number: 12),
        PhotoModel(photoImage: "galleryImage14", number: 13),
        PhotoModel(photoImage: "galleryImage15", number: 14),
        PhotoModel(photoImage: "galleryImage16", number: 15),
        PhotoModel(photoImage: "galleryImage17", number: 16),
        PhotoModel(photoImage: "galleryImage18", number: 17),
        PhotoModel(photoImage: "galleryImage19", number: 18),
        PhotoModel(photoImage: "galleryImage20", number: 19),
        PhotoModel(photoImage: "galleryImage21", number: 20),
        PhotoModel(photoImage: "galleryImage22", number: 21),
        PhotoModel(photoImage: "galleryImage23", number: 22),
        PhotoModel(photoImage: "galleryImage24", number: 23),
    ]
    
    // MARK: - Constants
    final let photoInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
    final let photoLineSpacing : CGFloat = 3
    final let photoInterItemSpacing : CGFloat = 5
    final let photoCellHeight : CGFloat = 119
    
    
    
    
    
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

extension PhotoCollectionViewController {
    
    // MARK: - layout()
    private func layout() {
        [topBarView,PhotoCollectionView].forEach {
            view.addSubview($0)
        }
        
        [xButton, recentFileLabel, sendButton].forEach {
            topBarView.addSubview($0)
        }
        
        // MARK: - topBarView
        topBarView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            make.leading.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(16)
        }
        
        // MARK: - xButton
        xButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalToSuperview().offset(17)
            make.width.equalTo(14)
            make.height.equalTo(14)
        }
        
        // MARK: - recentFileLable
        recentFileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(self.xButton.snp.trailing).offset(129)
        }
        
        // MARK: - sendButton
        sendButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(self.recentFileLabel.snp.trailing).offset(125)
        }
        
        // MARK: - PhotoCollectionView
        PhotoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.topBarView.snp.bottom).offset(11)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(calculateCellHeight())
            
        }
        
        view.backgroundColor = .white
    }
    
    private func register() {
        PhotoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * photoCellHeight + (heightCount - 1) * photoLineSpacing + photoInset.top + photoInset.bottom
    }
    
}

extension PhotoCollectionViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let itemCellWidth = screenWidth - photoInset.left - photoInset.right - photoInterItemSpacing * 2
        return CGSize(width: itemCellWidth / 3, height: 123)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoInset
    }
}


extension PhotoCollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        photoCell.dataBind(model: photoList[indexPath.item])
        return photoCell
    }
    
    
}
