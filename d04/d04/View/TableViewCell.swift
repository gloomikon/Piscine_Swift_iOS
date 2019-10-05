//
//  TableViewCell.swift
//  d04
//
//  Created by Mykola ZHURBA on 10/5/19.
//  Copyright © 2019 mzhurba. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var tweet: Tweet? {
        didSet {
            name.text = tweet!.name;
            textLbl.text = tweet!.text;
            date.text = tweet!.date;
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
