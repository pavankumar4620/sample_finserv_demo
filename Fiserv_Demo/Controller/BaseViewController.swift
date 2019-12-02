//
//  BaseViewController.swift
//  Fiserv_Demo
//
//  Created by Mac on 01/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class BaseViewControlller: UIViewController  {
    var footerView: UIView!
    var footerLabel: UILabel!
    let rightButton = UIButton(type: .custom)
    let storyBoard : UIStoryboard = UIStoryboard(name: Identifier.storyboardName, bundle:nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.designFooterView()
        self.crateBarButtontem()
    }
    /*
     designFooterView method is used to create footerview in every screen
    */
    func designFooterView()
    {
        footerView = UIView()
        footerLabel = UILabel()
        footerView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        self.footerView.addSubview(footerLabel)
        self.view.addSubview(footerView)
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        footerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        footerView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        footerLabel.leftAnchor.constraint(equalTo: self.footerView.leftAnchor, constant: 0).isActive = true
        footerLabel.rightAnchor.constraint(equalTo: self.footerView.rightAnchor, constant: 0).isActive = true
        footerLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        footerLabel.centerYAnchor.constraint(equalTo: self.footerView.centerYAnchor).isActive = true
        
        footerLabel.text = Footer.footer
        footerLabel.textColor = UIColor.black
        footerLabel.textAlignment = .center
    }
    /*
     crateBarButtontem method is used to create navigation bar button item dynamically in every screen
     */

    func crateBarButtontem()
    {
        rightButton.setImage(UIImage(named: NavigationBar.cart), for: .normal)
        rightButton.addTarget(self, action: #selector(cartBtnClicked), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    /*
     cartBtnClicked method is used for goto cart scteen
     */

    @objc @IBAction func cartBtnClicked(_ sender: Any) {
        if Cart.cartList.count > 0 {
        let cartVc = storyBoard.instantiateViewController(withIdentifier: Identifier.cartScreen) as! CartViewController
        self.navigationController?.pushViewController(cartVc, animated: true)
        } else {
            let alertController = UIAlertController(title: "Alert", message: Alert.noRecord_Cart , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
