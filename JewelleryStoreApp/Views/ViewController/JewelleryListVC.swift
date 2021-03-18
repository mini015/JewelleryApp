//
//  JewelleryListVC.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

import UIKit

// class to show the list of all jewellery
class JewelleryListVC: UIViewController {
    
    @IBOutlet weak var jewelleryTV: UITableView!
    let jewelleryVM = JewelleryListViewModel() // view model for controller class to handle all the business logic

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        jewelleryVM.requestJewelleryData()
        jewelleryVM.refreshDataOnUI = { [weak self] in
            self?.jewelleryTV.reloadData()
        }
    }
    
    /// method to configure the table view
    private func configureTableView(){
        jewelleryTV.dataSource = self
        jewelleryTV.delegate = self
        jewelleryTV.tableFooterView = UIView(frame: .zero)
        self.jewelleryTV.registerNib(forClass:InfoTableViewCell.self)
        self.jewelleryTV.registerNib(forClass: CollapsibleTableViewCell.self)
    }
}

extension JewelleryListVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let data =  jewelleryVM.jewelleryData{
            return data.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let jewelleryData = jewelleryVM.jewelleryData{
            let subcategory = jewelleryData[section].jewellery.subCategory
            return jewelleryData[section].isCollapsed ?  0 : subcategory.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = jewelleryTV.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as? InfoTableViewCell else  {
            return UITableViewCell()
        }
        if let jData = jewelleryVM.jewelleryData{
            let jCategory = jData[indexPath.section].jewellery
            let jewelleryName = jCategory.subCategory[indexPath.row].name.capitalized
            let jewelleryDesc = jCategory.subCategory[indexPath.row].description
            cell.configureText(title:jewelleryName, description:jewelleryDesc)
        }
        return cell
    }
    
    
}

extension JewelleryListVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = jewelleryTV.dequeueReusableCell(withIdentifier: "CollapsibleTableViewCell") as? CollapsibleTableViewCell
        if let jData = jewelleryVM.jewelleryData{
            let jCategory = jData[section]
            let catName = jCategory.jewellery.categoryName
            let data = HeaderContent(name: catName.capitalized, iconImage: jewelleryVM.getJewelleryImage(name: catName), arrowType: jCategory.isCollapsed ? .downArrow :.upArrow)
            header?.configure(data: data)
            header?.tag = section
            header?.headerTapped = {[weak self] (tag) in
                self?.jewelleryVM.collapseHeader(jewCategoryIndex: tag)
            }
        }
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}


