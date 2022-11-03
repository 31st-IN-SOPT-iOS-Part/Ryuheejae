import UIKit

import SnapKit
import SwiftyColor
import Then

class ChatCollectionViewController : UIViewController {
    
    // MARK: - funcView
    private let funcView : UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    // MARK: - chatLabel
    private let chatLabel : UILabel =  {
        let label  = UILabel()
        label.text = "채팅"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // MARK: - openChatLabel
    private let openChatLabel : UILabel =  {
        let label  = UILabel()
        label.text = "오픈채팅"
        label.textColor = 0xA6A6A6.color
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // MARK: - plusIcon
    private let plusIcon : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusIcon"), for: .normal)
        button.addTarget(self, action: #selector(touchupPlusButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - settingIcon
    private let settingIcon : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settingIcon"), for: .normal)
        return button
    }()
    
    // MARK: - userPoster
    private let userPoster : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userPoster")
        return imageView
    }()
    
    // MARK: - chatCollectionView
    private lazy var chatCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var chatList: [ChatModel] = [
        ChatModel(name: "김솝트", profileMessage: "햄볶아요", profileImage: "Image", sendTime: "오후 9:41"),
        ChatModel(name: "안솝트", profileMessage: "귀여아요", profileImage: "Image 1", sendTime: "오후 9:41"),
        ChatModel(name: "최솝트", profileMessage: "킹받아요", profileImage: "Image 2", sendTime: "오후 9:41"),
        ChatModel(name: "황솝트", profileMessage: "들어아요", profileImage: "Image 3", sendTime: "오후 9:41"),
        ChatModel(name: "장솝트", profileMessage: "작아요", profileImage: "Image 4", sendTime: "오후 9:41"),
        ChatModel(name: "류솝트", profileMessage: "자가용", profileImage: "Image 5", sendTime: "오후 9:41"),
        ChatModel(name: "성솝트", profileMessage: "암요암요", profileImage: "Image 6", sendTime: "오후 9:41"),
        ChatModel(name: "진솝트", profileMessage: "힘내봐아요", profileImage: "Image 7", sendTime: "오후 9:41"),
        ChatModel(name: "정솝트", profileMessage: "잘지내봐요", profileImage: "Image 7", sendTime: "오후 9:41"),
        ChatModel(name: "남궁솝트", profileMessage:  "보고파요", profileImage: "Image", sendTime: "오후 9:41"),
        ChatModel(name: "행복솝트", profileMessage: "난 이제 지쳤어요 땡벌땡벌",profileImage: "Image", sendTime: "오후 9:41"),
        ChatModel(name: "안녕솝트", profileMessage: "상태메세지는 여기에", profileImage: "Image 1", sendTime: "오후 9:41"),
    ]
    
    // MARK: - presentToPhotoVC func
    private func presentToPhotoVC(){
        let PhotoCollectionVC = PhotoCollectionViewController()
        PhotoCollectionVC.modalPresentationStyle = .formSheet
        self.present(PhotoCollectionVC,animated: true,completion: nil)
    }
    
    // MARK: - objc touchupSignUpButton func
    @objc
    private func touchupPlusButton(){
        presentToPhotoVC()
    }
    
    
    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
    }
}

extension ChatCollectionViewController {
    
    // MARK: - layout func
    private func layout() {
        
        [funcView,userPoster,chatCollectionView].forEach {
            view.addSubview($0)
        }
        
        
        [chatLabel, openChatLabel, plusIcon, settingIcon].forEach {
            funcView.addSubview($0)
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
            make.width.equalTo(19)
            make.height.equalTo(19)
            
        }
        
        settingIcon.snp.makeConstraints { make in
            make.top.equalTo(self.plusIcon)
            make.leading.equalTo(self.plusIcon.snp.trailing).offset(12)
            make.width.equalTo(19)
            make.height.equalTo(19)
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
            make.height.equalTo(chatList.count * 60)
        }
        
    }
    // MARK: - General Helpers
    private func register() {
        chatCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
    }
    
}


extension ChatCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    // cell 하나의 크기를 정해주는 함수. CGSize를 리턴
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 60)
    }
    
    // Layout 구현 흐름에서 줄 바꿈의 간격을 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Layout  구현 흐름에서 줄 바꿈이 아닌 셀 간 간격을 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // CollectionView 섹션 하나 당의 Inset을 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }
}

extension ChatCollectionViewController : UICollectionViewDataSource{
    
    // cell을 몇개 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    // 어떤 cell을 만들거나
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as? ChatCollectionViewCell else {return UICollectionViewCell()}
        chatCell.dataBind(model: chatList[indexPath.item])
        return chatCell
    }
}
