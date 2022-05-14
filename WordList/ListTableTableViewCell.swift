//
//  ListTableTableViewCell.swift
//  WordList
//
//  Created by 中井日向子 on 2022/05/14.
//

import UIKit

class ListTableTableViewCell: UITableViewCell {
    
    @IBOutlet var englishLable: UILabel!
    @IBOutlet var japaneseLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
