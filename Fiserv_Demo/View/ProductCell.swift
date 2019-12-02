//
//  receipeCell.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet var bgView: UIView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var costLabel: UILabel!

    var product: Product! {
        didSet {
           self.productNameLabel.text = product.productName
            self.costLabel.text = "\u{20B9}" + String(format:"%.2f",product.cost!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        bgView.layer.borderColor = UIColor.gray.cgColor
        bgView.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
