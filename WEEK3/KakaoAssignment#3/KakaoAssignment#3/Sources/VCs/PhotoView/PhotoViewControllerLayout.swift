import CoreFoundation
import UIKit

extension PhotoCollectionViewController {
    
    // MARK: - layout()
    func layout() {
        [topBarView,PhotoCollectionView].forEach {
            view.addSubview($0)
        }
        
        [closeButton, recentFileLabel, sendButton].forEach {
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
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalToSuperview().offset(17)
            make.size.equalTo(14)
        }
        
        // MARK: - recentFileLable
        recentFileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(self.closeButton.snp.trailing).offset(129)
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
    
    func register() {
        PhotoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
    
    func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoDummyData.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * photoCellHeight + (heightCount - 1) * photoLineSpacing + photoInset.top + photoInset.bottom
    }
    
    
    
}
