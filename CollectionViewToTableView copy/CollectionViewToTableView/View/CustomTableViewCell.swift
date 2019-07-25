//
//  CustomTableViewCell.swift
//  CollectionViewToTableView
//
//  Created by Ngoc on 7/25/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var detailId: UILabel!
    @IBOutlet weak var detailtitle: UILabel!
    @IBOutlet weak var detialCompleted: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
