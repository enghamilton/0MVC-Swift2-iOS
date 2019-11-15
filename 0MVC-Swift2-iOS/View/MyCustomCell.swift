//
//  TableViewCell.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 07/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {
    
    @IBOutlet weak var imageThumb:UIImage!
    
    @IBOutlet weak var myCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
