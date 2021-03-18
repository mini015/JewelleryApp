//
//  ServiceHelper.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/17/21.
//

import Foundation

//This class is the helper class whee the code to make any call to fetch the data will be implemented
class ServiceHelper{
    
    
    /// The method is responsible to fetch the data from JewelleryJson and parse it in the model form
    /// - Parameter completion: block to return the response in model form for jewellery data
    /// - Returns: Jewellery array
    func fetchData(completion:@escaping ([JewelleryCategory]?) -> ())  {
        if let path = Bundle.main.path(forResource: "Jewellery", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSONDecoder().decode([JewelleryCategory].self, from: data)
                completion(jsonObj)
            } catch let error {
                print("parse error: \(error)")
                completion(nil)
            }
        } else {
            print("Invalid filename/path.")
            completion(nil)
        }
    }
}


