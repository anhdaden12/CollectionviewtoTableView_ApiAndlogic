//
//  DetailTableViewController.swift
//  CollectionViewToTableView
//
//  Created by Ngoc on 7/25/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit


class DetailTableViewController: UITableViewController {
   
    
    var receivedUserData: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "UserID number: " + String(receivedUserData.first!.userId)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if receivedUserData.count == nil {
            return 0
        } else {
            return receivedUserData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
        cell?.detailId.text = String(receivedUserData[indexPath.row].id)
        cell?.detailtitle.text = receivedUserData[indexPath.row].title
        cell?.detialCompleted.text = String(receivedUserData[indexPath.row].completed)
        return cell!
    }
 
}
