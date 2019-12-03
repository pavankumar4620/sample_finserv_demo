//
//  Extension.swift
//  Fiserv_Demo
//
//  Created by Mac on 03/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

extension UIView {
    func setRoundedCorners(){
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}
