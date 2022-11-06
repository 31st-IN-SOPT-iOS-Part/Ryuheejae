import UIKit
extension ChatCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    // cell 하나의 크기를 정해주는 함수. CGSize를 리턴
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 60)
    }
    
    // CollectionView 섹션 하나 당의 Inset을 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }
}
