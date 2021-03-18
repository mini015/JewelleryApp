//
//  JewelleryModel.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

//Model class to parse the jewellery data from the JSON file
import Foundation

/// Model to parse the main category
struct JewelleryCategory:Codable {
    var categoryName:String // name such as "Rings"
    var subCategory:[JewellerySubCategory] //Array of all jewellery that are of type rings
    
    private enum CodingKeys:String,CodingKey{
        case categoryName = "name"
        case subCategory = "sub_category"
    }
}

/// Model to parse the sub category
struct JewellerySubCategory:Codable {
    var name:String // name of jewellery
    var description:String // description of jewellery
    
    private enum CodingKeys:String,CodingKey{
        case name,description = "display_name"
    }
}
