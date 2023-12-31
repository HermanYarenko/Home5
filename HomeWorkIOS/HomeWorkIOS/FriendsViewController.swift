//
//  FriendsViewController.swift
//  HomeWorkIOS
//
//  Created by Герман Яренко on 22.11.23.

import UIKit

final class FriendsViewController: UITableViewController {
    private var friends = [Friend]()
    
    private var profileView = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        let buttonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(goToProfileViewController))
        navigationController?.navigationBar.topItem?.setRightBarButton(buttonItem, animated: true)
        tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.Identifier.photoCellIdentifier)
        NetworkService().getFriends{ [weak self] friends in
            self?.friends = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? FriendCell else { return UITableViewCell() }
        cell.updateCell(model: friends[indexPath.row])
        return cell
    }
}


private extension FriendsViewController {
    @objc func goToProfileViewController() {
        let transition = CATransition()
        transition.duration = 1
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
}
