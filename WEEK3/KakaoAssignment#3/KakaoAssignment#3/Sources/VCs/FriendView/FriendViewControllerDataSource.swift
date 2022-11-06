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
}
