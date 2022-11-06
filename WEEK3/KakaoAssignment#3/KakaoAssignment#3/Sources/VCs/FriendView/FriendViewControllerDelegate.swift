import UIKit
extension FriendTabbleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "삭제", handler: {action, view, completionHandler in print("action performed")
            completionHandler(true)
        })
        action.backgroundColor = .red
        //action 글자 색상 변경 어케하징
        
        friendDummyData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyProfileHeaderView.identifier) as? MyProfileHeaderView else {
            return UIView()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 73
    }
}
