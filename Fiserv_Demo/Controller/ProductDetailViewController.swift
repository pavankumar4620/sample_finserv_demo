//
//  ProductDetailViewController.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ProductDetailViewController: BaseViewControlller {
   var product: Product!
   @IBOutlet var productImgview: UIImageView!
   @IBOutlet var productNameLabel: UILabel!
   @IBOutlet var costLabel: UILabel!
   @IBOutlet var addToCartBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = product.category
        addToCartBtn.backgroundColor = (product.category == Category.NonVeg.rawValue) ? UIColor.red : UIColor.green
        addToCartBtn.layer.cornerRadius = 10
        addToCartBtn.layer.masksToBounds = true
        self.productImgview.image = UIImage(named: product.img!)
        self.productNameLabel.text = product.productName
        self.costLabel.text = "\u{20B9}" + String(format:"%.2f",product.cost!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let filterData = Cart.cartList.filter ({ return $0.productId == product.productId})
        self.addToCartBtn.isHidden = (filterData.count > 0) ?  true :  false
    }
    
    @IBAction func addToCartBtnClicked(sender: UIButton){
        Cart.cartList.append(self.product)
        self.addToCartBtn.isHidden = true
    }
}
