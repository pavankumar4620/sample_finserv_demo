//
//  CategoryCell.swift
//  Fiserv_Demo
//
//  Created by Mac on 29/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var bgView: UIView!
    @IBOutlet var categoryBtn: UIButton!
    @IBOutlet var showImagesBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.setRoundedCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
