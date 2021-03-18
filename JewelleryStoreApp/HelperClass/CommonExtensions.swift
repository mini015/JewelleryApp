//
//  CommonExtensions.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

//this class is used to write common methods that are uselful throughout the project
import Foundation
import UIKit

extension UITableView{
    
    /// method to register the cell/view class
    /// - Parameter givenClass: The view class that needs to be registered
    func registerNib(forClass givenClass:AnyClass){
        self.register(UINib(nibName:String(describing:givenClass.self), bundle: nil),forCellReuseIdentifier:String(describing:givenClass.self))
    }
}


