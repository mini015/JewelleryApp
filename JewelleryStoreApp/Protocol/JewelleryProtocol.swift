//
//  JewelleryProtocol.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

import Foundation
import UIKit

/// Enum to define all the jewellery category type that we get from jewellery json
enum JewelleryType:String{
    case bangles
    case rings
    case earrings
    func image() -> UIImage? {
        switch self {
        case .bangles:
            return UIImage(named: "Bangle")
        case .rings:
            return UIImage(named: "Ring")
        case .earrings:
            return UIImage(named: "earing")
        }
    }
}
protocol JewelleryImage {
}
// This protocol class is used to define funtions which are related to jewellery list
extension JewelleryImage{
    
    /// This method is used to generate image for jewellery category based on category name
    /// - Parameter categoryName: The name of jewellery category such as bangles,ring etc
    /// - Returns: UIImage for that particular category
    func jewelleryCategoryImage(categoryName:String)->  UIImage? {
        if let type = JewelleryType(rawValue: categoryName){
            return type.image()
        }
        // for any non defined category it will return the default image
        return UIImage(named: "Diamond")
    }
}
