import UIKit
extension WelcomeViewController {
    
    // MARK: - layout func
    func layout(){
        view.addSubview(containerView)
        let contentComponent: [UIView] = [nameLabel,checkButton]
        containerView.addSubviews(contentComponent)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        // MARK: - nameLabel AutoLayout
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(144)
        }
        
        // MARK: - checkButton AutoLayout
        checkButton.snp.makeConstraints{ make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(117)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
    }
}
