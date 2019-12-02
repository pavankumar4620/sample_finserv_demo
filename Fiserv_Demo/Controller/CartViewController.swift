//
//  CartViewController.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit



class CartViewController: BaseViewControlller {
    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var buyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Title.cart
        buyBtn.layer.cornerRadius = 10
        buyBtn.layer.masksToBounds = true
        
        self.rightButton.setImage(UIImage(named: NavigationBar.home), for: .normal)
        self.totalAmountLabel.text =  "\u{20B9}" + String(format:"%.2f",Cart.productsSumCalculation())
    }
    
    override func cartBtnClicked(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
}



extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(Cart.cartList.count)
        return Cart.cartList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: Identifier.cartCell, for: indexPath) as? CartCell else {
            return UITableViewCell()
        }
        cell.product = Cart.cartList[indexPath.row]
        cell.deleteBtn.tag = indexPath.row
        cell.minusBtn.tag = indexPath.row
        cell.plusbtn.tag = indexPath.row

        return cell
    }
}
extension CartViewController {
    /*
     plusBtnClicked method is used to increase the no.of quantity of the product in the cart
     */
    @IBAction func plusBtnClicked(sender: UIButton) {
        var product = Cart.cartList[sender.tag]
        product.qty = product.qty! + 1
        Cart.cartList.remove(at: sender.tag)
        Cart.cartList.insert(product, at: sender.tag)
        self.cartTableView.reloadRows(at: [IndexPath(item: sender.tag, section: 0)], with: .none)
        self.totalAmountLabel.text =  "\u{20B9}" + String(format:"%.2f",Cart.productsSumCalculation())
    }
    
    /*
     minusBtnClicked method is used to decrease the no.of quantity of the product in the cart
     */
    @IBAction func minusBtnClicked(sender: UIButton) {
        var product = Cart.cartList[sender.tag]
        product.qty = (product.qty! < 1) ? (1) : (product.qty! - 1)
        Cart.cartList.remove(at: sender.tag)
        Cart.cartList.insert(product, at: sender.tag)
        self.cartTableView.reloadRows(at: [IndexPath(item: sender.tag, section: 0)], with: .none)
        self.totalAmountLabel.text =  "\u{20B9}" + String(format:"%.2f",Cart.productsSumCalculation())
    }
    
    /*
      deleteBtnClicked method is used to delete the product from the cart
     */
    @IBAction func deleteBtnClicked(sender: UIButton) {
        Cart.cartList.remove(at: sender.tag)
        self.cartTableView.reloadData()
        self.totalAmountLabel.text =  "\u{20B9}" + String(format:"%.2f",Cart.productsSumCalculation())
    }
    
    @IBAction func buyBtnClicked(sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: Alert.successAlert , preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            Cart.cartList.removeAll()
            self.navigationController?.popToRootViewController(animated: false)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
