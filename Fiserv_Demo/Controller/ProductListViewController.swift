//
//  receipeViewController.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

enum Category: String {
    case Veg = "Veg", NonVeg = "Non-Veg"
}



class ProductListViewController: BaseViewControlller {
    private var service: Services!
    @IBOutlet var product_tableView: UITableView!
    private var productList : [Product]?
    var category : Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.category.rawValue
        service = Services()
    }
    override func viewWillAppear(_ animated: Bool) {
        /*
         Below code is used for fetch the data from json file
         */

        service.genericFetchData { (product: [Product]) in
            DispatchQueue.main.async { [unowned self] in
                self.productList = product.filter({ $0.category == self.category.rawValue })
                self.product_tableView.reloadData()
           }
        }
    }
}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: Identifier.productCell, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        cell.bgView.backgroundColor = (self.category.rawValue == "Veg") ? UIColor.green : UIColor.red
        cell.product = productList?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailVc = storyBoard.instantiateViewController(withIdentifier: Identifier.productDetailScreen) as! ProductDetailViewController
        productDetailVc.product = productList?[indexPath.row]
        self.navigationController?.pushViewController(productDetailVc, animated: true)
    }
}
