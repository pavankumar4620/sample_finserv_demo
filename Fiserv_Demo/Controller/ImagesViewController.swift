//
//  ImagesViewController.swift
//  Fiserv_Demo
//
//  Created by Mac on 01/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ImagesViewController: BaseViewControlller {
    private var productList : [Product]?
    var category : Category!
    private var service: Services!
    @IBOutlet var imageTableView: UITableView!
    
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
                self.imageTableView.reloadData()
            }
        }
    }
}

extension ImagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "ImagesCell", for: indexPath) as? ImagesCell else {
            return UITableViewCell()
        }
        cell.product = productList?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
