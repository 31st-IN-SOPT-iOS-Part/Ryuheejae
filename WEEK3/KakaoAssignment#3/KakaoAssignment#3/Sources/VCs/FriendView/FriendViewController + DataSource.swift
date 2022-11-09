// MARK: - UITableViewDataSource

import UIKit
extension FriendTabbleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendDummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = friendTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else {return UITableViewCell()}
        
        friendCell.dataBind(model : friendDummyData[indexPath.row])
        return friendCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ProfileVC = ProfileViewController()
        
        if (friendDummyData[indexPath.row] as FriendModel?) != nil {
            ProfileVC.dataBindProfile(profileName: friendDummyData[indexPath.row].name ?? "(이름없음)", profileImage: friendDummyData[indexPath.row].profileImage ?? "(프로필 없음)")
        }

        ProfileVC.modalPresentationStyle = .fullScreen
        self.present(ProfileVC, animated: true, completion: nil)
    }
}
