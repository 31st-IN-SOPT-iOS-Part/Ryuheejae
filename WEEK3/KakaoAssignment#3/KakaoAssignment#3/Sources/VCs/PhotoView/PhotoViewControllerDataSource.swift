import UIKit
var photoIndexArray: [Int] = []
extension PhotoCollectionViewController: UICollectionViewDataSource {
    // MARK: - Variables
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        photoCell.dataBind(model: photoDummyData[indexPath.item])
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        
        if selectedImageList.contains(indexPath.row){
            selectedImageList.remove(at: Int(photoCell.imageIndexLabel.text!)!-1)
            photoCell.deselectedLayout()
        }else {
            selectedImageList.append(indexPath.item)
            photoCell.selectedLayout()
        }
        
        if !selectedImageList.isEmpty {
            for i in 0...selectedImageList.count-1 {
                let index = IndexPath(item: selectedImageList[i], section: 0)
                let cell = collectionView.cellForItem(at: index) as! PhotoCollectionViewCell
                cell.imageIndexLabel.text = "\(i+1)"
            }
        }
    }
}



