//
//  InfoTableViewCell.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

import UIKit

//This table view cell is used to show a title text and then a description text 
class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: GeneralHeadingLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /// method to populate the data on cell
    /// - Parameters:
    ///   - title: title text
    ///   - description: description text
    func configureText(title:String, description:String){
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
    
}
