//
//  Cart.swift
//  Fiserv_Demo
//
//  Created by Mac on 01/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation


struct Cart {
    static var cartList = [Product]()
    static func productsSumCalculation()-> Double{
        let totalAmount = cartList.reduce(0){ (result, product) in
            return (result + (product.cost! * Double(product.qty!)))
        }
        return Double(totalAmount)
    }
}
