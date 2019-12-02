//
//  receipe.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

struct Product: Decodable {
    var category: String?
    var productId: Int?
    var productName: String?
    var cost: Double?
    var productDesc: String?
    var qty: Int?
    var img : String?
}
