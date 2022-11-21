import UIKit

import SnapKit
import SwiftyColor
import Then


// MARK: - ChatCollectionViewCell

final class ChatCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ChatCollectionViewCell"
    
    // MARK: - UI Components
    private let profileContainerView = UIView()
    
    private let profileImageView = UIImageView().then {
        $0.makeCornerRound(radius:17)
    }
    
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let profileMessage = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }
    
    private let sendTime = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 8, weight: .medium)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChatCollectionViewCell {
    private func layout() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        [profileContainerView, nameLabel, profileMessage, sendTime].forEach {
            contentView.addSubview($0)
        }
        
        profileContainerView.addSubview(profileImageView)
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(340)
            make.height.equalTo(50)
        }
        
        
        
        profileContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.size.equalTo(50)
        }
        
        profileImageView.snp.makeConstraints { make in
            // 수정필요
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(self.profileContainerView.snp.trailing).offset(3)
        }
        
        profileMessage.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(3)
            make.leading.equalTo(self.nameLabel)
        }
        
        sendTime.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(self.nameLabel.snp.trailing).offset(226)
        }
        
    }
    
    func dataBind(model: FriendModel){
        nameLabel.text = model.name
        profileMessage.text = model.profileMessage
        profileImageView.image = UIImage(named: model.profileImage ?? "")
        sendTime.text = model.sendTime
        
    }
}
