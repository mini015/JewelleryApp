//
//  JewelleryListViewModel.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

import Foundation
import UIKit

/// struct to fetch the complete model of data that needs to be populated on the UI for jewellery List
struct JewellerySection{
    var jewellery:JewelleryCategory // data for jewellery
    var isCollapsed:Bool // to keep track whether the user has choose to open the section or to close it
}

// this view model class is responsible to handle all the business logic to show the list of jewellery fetched from json on table view
class JewelleryListViewModel{
    private(set) var jewelleryData: [JewellerySection]?{
        didSet{
            refreshData()
        }
    }
    var refreshDataOnUI:()->() = {}
    
    /// method to fetch the parsed data from json and populate on controller
    func requestJewelleryData(){
        ServiceHelper().fetchData { [weak self] (data) in
            if let data = data {
                self?.jewelleryData = self?.getJewellerySectionData(jewelleryData:data)
            }
        }
    }
    
    /// method to get the data in form of tableview section model to populate on UI
    /// - Parameter jewelleryData: parsed data of jewellery fetched from json
    /// - Returns: data in format of section
    private func getJewellerySectionData(jewelleryData:[JewelleryCategory]) -> [JewellerySection]{
        var JewelleryArray = [JewellerySection]()
        for jewellery in jewelleryData{
            let jewCategory = JewellerySection(jewellery: jewellery, isCollapsed: true)
            JewelleryArray.append(jewCategory)
        }
        return JewelleryArray
    }
    
    /// method to refresh the table view to populate data on UI
    private func refreshData(){
        DispatchQueue.main.async {[weak self] in
            self?.refreshDataOnUI()
        }
    }
}

extension JewelleryListViewModel:JewelleryImage{
    
    
    /// method to handle the call when user choose to open/close the jewellery section
    /// - Parameter jewCategoryIndex: section on which user has tapped to open/close it
    func collapseHeader(jewCategoryIndex:Int){
        if let tappedJewCategory = jewelleryData?[jewCategoryIndex]{
            var updatedCategory = tappedJewCategory
            // update the collapsed state
            updatedCategory.isCollapsed = !updatedCategory.isCollapsed
            jewelleryData?[jewCategoryIndex] = updatedCategory
        }
        
    }
    
    /// method to get the image corrosponding to each category of jewellery
    /// - Parameter name: name of jewellery category
    /// - Returns: image corrosponding to that category
    func getJewelleryImage(name:String) -> UIImage?{
       return jewelleryCategoryImage(categoryName: name)
    }
}


