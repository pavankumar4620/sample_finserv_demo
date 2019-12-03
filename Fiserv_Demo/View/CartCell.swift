//
//  CartCell.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var qtyLabel: UILabel!
    @IBOutlet var plusbtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var selectionView: UIView!
    @IBOutlet var deleteBtn : UIButton!

    var product: Product! {
        didSet {
            productNameLabel.text = product.productName! + " - \(String(describing: product.category!)) "
            qtyLabel.text = String(product.qty!)
            costLabel.text =  "\u{20B9}" + String(format:"%.2f",Double(product.qty!) * product.cost!)
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionView.setRoundedCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
