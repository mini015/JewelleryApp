//
//  CollapsibleTableViewCell.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

import UIKit

struct HeaderContent {
    var name:String
    var iconImage:UIImage?
    var arrowType:ArrowType
}
/// enum to define the arrow type based on user selection such as upward/downward
enum ArrowType {
    case upArrow
    case downArrow
    
    func image() -> UIImage?{
        switch self {
        case .upArrow:
            return UIImage(named: "UpArrow")
        case .downArrow:
            return UIImage(named: "DownArrow")
        }
    }
}
class CollapsibleTableViewCell: UITableViewCell {
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var nameLabel: BoldTitleLabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    var headerTapped:((_ tag:Int)->())? // closure to handle the tap on section
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /// method to configure data
    /// - Parameter data: model to populate the data
    func configure(data:HeaderContent){
        self.IconImage.image = data.iconImage
        self.nameLabel.text = data.name
        self.arrowImageView.image = data.arrowType.image()
    }
    
    
    @IBAction func CollapsibleAction(_ sender: UIButton) {
        headerTapped?(self.tag)
    }
}
