//
//  NoteTableViewCell.swift
//  TestApp
//
//  Created by Larissa on 2019-11-18.
//  Copyright © 2019 AlayaCare. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
