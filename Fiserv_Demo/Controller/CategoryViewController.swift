//
//  ViewController.swift
//  Fiserv_Demo
//
//  Created by Mac on 29/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewControlller {
    @IBOutlet var categoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Category"
        self.registerNibFiles()
    }
    func registerNibFiles(){
        categoryTableView.register(UINib(nibName: Identifier.categoryCell, bundle: nil), forCellReuseIdentifier: Identifier.categoryCell)
    }
    
}

extension CategoryViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: Identifier.categoryCell, for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0{
            cell.categoryLabel.text = Title.veg
        }else {
            cell.categoryLabel.text = Title.nonVeg
        }
        cell.categoryBtn.tag = indexPath.row
        cell.showImagesBtn.tag  = indexPath.row
        cell.categoryBtn.addTarget(self, action: #selector(categorySelectionBtnClicked), for: .touchUpInside)
        cell.showImagesBtn.addTarget(self, action: #selector(showImagesBtnClicked(sender:)), for: .touchUpInside)

        return cell
    }
}

extension CategoryViewController {
    @IBAction func categorySelectionBtnClicked(sender: UIButton){
        let productVc = storyBoard.instantiateViewController(withIdentifier: Identifier.productListScreen) as! ProductListViewController
        productVc.category = (sender.tag == 0) ? .Veg : .NonVeg
        self.navigationController?.pushViewController(productVc, animated: true)
    }
    @IBAction func showImagesBtnClicked(sender: UIButton){
        let imageVC = storyBoard.instantiateViewController(withIdentifier: Identifier.imagesScreen) as! ImagesViewController
        imageVC.category = (sender.tag == 0) ? .Veg : .NonVeg
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
}
