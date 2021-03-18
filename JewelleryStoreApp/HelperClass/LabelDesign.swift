//
//  LabelDesign.swift
//  JewelleryStoreApp
//
//  Created by Shivangi Gupta on 3/18/21.
//  Copyright © 2021 Shivangi Development Team. All rights reserved.

import Foundation
import UIKit

/// Enum to define font size for different types of labels depending upon usage
enum Fonts {
    case boldHeading
    case heading
    case subHeading
    
    /// function to return the font size
    /// - Returns: font size
    func fontSize() -> CGFloat {
        switch self {
        case .boldHeading:
            return 18
        case .heading:
            return 18
        case .subHeading:
            return 15
        }
    }
}
//MARK: General Labels // Default system colour is black


/// Label class to denote heading type label such as name
class GeneralHeadingLabel: UILabel {
    override func awakeFromNib() {
        self.font = self.font.withSize(Fonts.heading.fontSize())
    }
}

/// Denotes the sizes for the text that goes along with headings, usually the descriptions
class GeneralDescriptionSubheadingLabel: UILabel {
    override func awakeFromNib() {
        self.font = self.font.withSize(Fonts.subHeading.fontSize())
        self.textColor = UIColor.gray
    }
}

/// Label class to denote heading type label such as name but in bold
class BoldTitleLabel:UILabel {
    override func awakeFromNib() {
        self.font = UIFont.boldSystemFont(ofSize: Fonts.boldHeading.fontSize())
    }
}



