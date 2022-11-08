import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView = UIImageView()
    
    private let imageIndexView = UIView().then {
        $0.backgroundColor = .imageBorder
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 9
        $0.isHidden = true
        
    }
    
    let imageIndexLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.isHidden = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    // 사진이 선택됐을 때의 레이아웃
    func selectedLayout() {
        contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.imageBorder.cgColor
        self.imageIndexView.isHidden = false
        self.imageIndexLabel.isHidden = false
    }
    
    // 사진 선택 해제
    func deselectedLayout() {
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.imageIndexView.isHidden = true
        self.imageIndexLabel.isHidden = true
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
            make.size.equalTo(119)
        }
        
        photoImageView.addSubview(imageIndexView)
        imageIndexView.addSubview(imageIndexLabel)
        
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageIndexView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(97)
            make.size.equalTo(18)
        }
        
        imageIndexLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(6)
        }
        
        
    }
    func dataBind(model: PhotoModel){
        photoImageView.image = UIImage(named: model.photoImage ?? " ")
    }
}
