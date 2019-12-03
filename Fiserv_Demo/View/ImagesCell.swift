//
//  ImagesCellTableViewCell.swift
//  Fiserv_Demo
//
//  Created by Mac on 01/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ImagesCell: UITableViewCell {
    @IBOutlet var productImg: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    
    var product: Product! {
        didSet{
        self.productNameLabel.text = product.productName!
        self.productImg.image = UIImage(named: product.img!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.productImg.layer.cornerRadius = 10
        self.productImg.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
