// MARK: - FriendTabViewController extension
extension FriendTabbleViewController {
    
    // MARK: - layout func
    func layout() {
        [friendView, friendTableView].forEach{
            view.addSubview($0)
        }
        
        [friendLabel,settingIcon].forEach{
            friendView.addSubview($0)
        }
        
        // MARK: - friendView AutoLayout
        friendView.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(-3)
            make.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(375)
            make.height.equalTo(52)
        }
        
        // MARK: - friendView AutoLayout
        friendTableView.snp.makeConstraints{ make in
            make.top.equalTo(self.friendView.snp.bottom).offset(23)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(70 * friendDummyData.count)
        }
        
        // MARK: - friendLabel AutoLayout
        friendLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalToSuperview().offset(14)
        }
        
        // MARK: - settingIcon AutoLayout
        settingIcon.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(286)
            make.size.equalTo(21)
        }
    }
    
    // MARK: - General Helpers
    func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        friendTableView.register(MyProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: MyProfileHeaderView.identifier)
    }
}
