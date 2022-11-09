import UIKit

import SnapKit
import SwiftyColor
import Then


// MARK: - FriendTableViewCell

final class FriendTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "FriendTableViewCell"
    
    // MARK: - UI Components
    private let profileContainerView = UIView()
    
    private let profileImageView = UIImageView().then {
        $0.makeCornerRound(radius:17)
    }
    
    private let name = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let profileMessage = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FriendTableViewCell {
    private func layout() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        [profileContainerView, name, profileMessage].forEach {
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
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(self.profileContainerView.snp.trailing).offset(3)
        }
 
        profileMessage.snp.makeConstraints { make in
            make.top.equalTo(self.name.snp.bottom).offset(3)
            make.leading.equalTo(self.name)
        }
        
    }
    
    func dataBind(model: FriendModel){
        name.text = model.name
        profileMessage.text = model.profileMessage
        profileImageView.image = UIImage(named: model.profileImage ?? "")
    }
}
