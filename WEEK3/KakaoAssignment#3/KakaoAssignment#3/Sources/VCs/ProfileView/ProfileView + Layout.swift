// MARK: - ProfileViewController extension

import UIKit
extension ProfileViewController {
    
    // MARK: - layout func
    func layout() {
        view.addSubview(containerView)
        
        let contentComponent: [UIView] = [closeButton,profileImgView,profileNameLabel,profileLine,funcView]
        containerView.addSubviews(contentComponent)
        
        let funcViewComponent: [UIView] = [chatMyselfButton,chatMyselfLabel,editProfileButton,
                                           editProfileLabel,kakaoStoryButton,kakaoStoryLabel]
        funcView.addSubviews(funcViewComponent)
        
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        // MARK: - xButton AutoLayout
        closeButton.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        // MARK: - profileImg AutoLayout
        profileImgView.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(470)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(139)
            make.width.equalTo(97)
            make.height.equalTo(96)
        }
        
        // MARK: - profileName AutoLayout
        profileNameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.profileImgView.snp.bottom).offset(8)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(164)
        }
        
        // MARK: - profileLine AutoLayout
        profileLine.snp.makeConstraints{ make in
            make.top.equalTo(self.profileNameLabel.snp.bottom).offset(42)
            make.width.equalTo(375)
            make.height.equalTo(1)
        }
        
        // MARK: - funcView AutoLayout
        funcView.snp.makeConstraints{ make in
            make.top.equalTo(self.profileLine.snp.bottom).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(44)
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        
        // MARK: - chatMyselfButton AutoLayout
        chatMyselfButton.snp.makeConstraints{ make in
            make.top.equalTo(self.funcView).offset(24)
            make.leading.equalTo(self.funcView).offset(39)
            make.width.equalTo(19)
            make.height.equalTo(18)
        }
        
        // MARK: - chatMyselfLabel AutoLayout
        chatMyselfLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.chatMyselfButton.snp.bottom).offset(8)
            make.leading.equalTo(self.funcView).offset(20)
        }
        
        // MARK: - editProfileButton AutoLayout
        editProfileButton.snp.makeConstraints{ make in
            make.top.equalTo(self.funcView).offset(21)
            make.leading.equalTo(self.funcView).offset(135)
            make.width.equalTo(18)
            make.height.equalTo(19)
        }
        
        // MARK: - editProfileLabel AutoLayout
        editProfileLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.editProfileButton.snp.bottom).offset(9)
            make.leading.equalTo(self.funcView).offset(116)
        }
        
        // MARK: - kakaoStoryButton AutoLayout
        kakaoStoryButton.snp.makeConstraints{make in
            make.top.equalTo(self.funcView).offset(22)
            make.leading.equalTo(self.funcView).offset(231)
            make.width.equalTo(18)
            make.height.equalTo(21)
        }
        
        // MARK: - kakaoStoryLabel AutoLayout
        kakaoStoryLabel.snp.makeConstraints{make in
            make.top.equalTo(self.kakaoStoryButton.snp.bottom).offset(6)
            make.leading.equalTo(self.funcView).offset(212)
        }
    }
    
    // MARK: - setViewBackgroundColor func
    func setViewBackgroundColor() {
        view.backgroundColor = .systemGray
    }
}
