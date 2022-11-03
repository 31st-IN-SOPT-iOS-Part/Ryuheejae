import UIKit

final class PhotoCollectionViewCell : UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private var photos = [UIImage]()
    private var photoarray = [Int]()
    
    private let photoImageView = UIImageView()
    
    private let imageIndexView = UIView().then {
        $0.backgroundColor = .yellow
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 9
        $0.isHidden = true
        
    }
    
    private let imageIndexLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.isHidden = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    override var isSelected: Bool{
        didSet {
            if isSelected {
                photoImageView.layer.borderWidth = 5
                photoImageView.layer.borderColor = UIColor.yellow.cgColor
                imageIndexView.isHidden = false
                imageIndexLabel.isHidden == false
                
            } else {
                photoImageView.layer.borderWidth = 0
                photoImageView.layer.borderColor = UIColor.clear.cgColor
                imageIndexView.isHidden = true
                imageIndexLabel.isHidden = true
            }
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PhotoCollectionViewCell {
    private func layout() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        contentView.addSubview(photoImageView)
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(119)
            make.height.equalTo(119)
        }
        
        photoImageView.addSubview(imageIndexView)
        imageIndexView.addSubview(imageIndexLabel)
        
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageIndexView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(97)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        
        imageIndexLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(7)
        }
        
//        photoSelectedView.snp.makeConstraints { make in
//
//        }
        
    }
    func dataBind(model: PhotoModel){
        photoImageView.image = UIImage(named: model.photoImage)
        imageIndexLabel.text = String(model.number)
        
    }
    
}
