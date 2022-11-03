import UIKit

final class PhotoCollectionViewCell : UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
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
        
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    func dataBind(model: PhotoModel){
        photoImageView.image = UIImage(named: model.photoImage)
        
    }
}
