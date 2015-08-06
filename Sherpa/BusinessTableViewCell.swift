//
//  BusinessTableViewCell.swift
//  Sherpa
//
//  Created by Amit Mondal on 8/1/15.


import UIKit

class BusinessTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var servicesLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
