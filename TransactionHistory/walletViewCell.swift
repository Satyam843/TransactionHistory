//
//  walletViewCell.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/21/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class walletViewCell: UITableViewCell {

    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblClosingBalance: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
