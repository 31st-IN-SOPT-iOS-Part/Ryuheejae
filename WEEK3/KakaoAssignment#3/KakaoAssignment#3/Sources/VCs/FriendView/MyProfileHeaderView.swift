//
//  MyProfileHeaderView.swift
//  KakaoAssignment#3
//
//  Created by 류희재 on 2022/11/05.
//

import UIKit
import Then

//MARK: - MyProfileTableViewCell

class MyProfileHeaderView: UITableViewHeaderFooterView {
    //MARK: - Identifier
    
    static let identifier = "MyProfileHeaderView"
    
    
    //MARK: - UI Components
    
    
    private let myProfileImg = UIImageView().then {
        $0.image = UIImage(named: "profileImg")
    }
    
    private let myProfileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let myProfileMsgLabel: UILabel = {
        let label = UILabel()
        label.text = "상태메시지는 여기에"
        label.font = .systemFont(ofSize: 11, weight: .light)
        label.textColor = .lightGray
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension MyProfileHeaderView {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [myProfileImg, myProfileNameLabel, myProfileMsgLabel].forEach {
            contentView.addSubview($0)
        }
        
        myProfileImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        myProfileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(myProfileImg.snp.trailing).offset(11)
        }
        
        myProfileMsgLabel.snp.makeConstraints {
            $0.top.equalTo(myProfileNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(myProfileNameLabel)
        }
    }
}
