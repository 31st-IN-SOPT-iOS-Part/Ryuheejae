import UIKit
extension ChatCollectionViewController : UICollectionViewDataSource{
    
    // cell을 몇개 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatDummyData.count
    }
    
    // 어떤 cell을 만들거나
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as? ChatCollectionViewCell else {return UICollectionViewCell()}
        chatCell.dataBind(model: chatDummyData[indexPath.item])
        return chatCell
    }
}
