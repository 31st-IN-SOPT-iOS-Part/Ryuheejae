import UIKit
extension ChatCollectionViewController {
    
    // MARK: - layout func
    func layout() {
        
        view.addSubview(containerView)
        
        let contentComponent: [UIView] = [funcView,userPoster,chatCollectionView]
        containerView.addSubviews(contentComponent)
        
        let funcViewComponent: [UIView] = [chatLabel, openChatLabel, plusIcon, settingIcon]
        funcView.addSubviews(funcViewComponent)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }

        funcView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(36)

        }
        chatLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        openChatLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(self.chatLabel.snp.trailing).offset(7)
        }

        plusIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalTo(self.openChatLabel.snp.trailing).offset(173)
            make.size.equalTo(19)

        }

        settingIcon.snp.makeConstraints { make in
            make.top.equalTo(self.plusIcon)
            make.leading.equalTo(self.plusIcon.snp.trailing).offset(12)
            make.size.equalTo(19)
        }

        userPoster.snp.makeConstraints { make in
            make.top.equalTo(self.funcView.snp.bottom).offset(16)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(343)
            make.height.equalTo(72)
        }

        chatCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.userPoster.snp.bottom).offset(8.5)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(chatDummyData.count * 60)
        }

    }
    // MARK: - General Helpers
    func register() {
        chatCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
    }
    
}
