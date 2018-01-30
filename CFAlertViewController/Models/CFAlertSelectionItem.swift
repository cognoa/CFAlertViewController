//
//  CFAlertSelectionItem.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 1/30/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

@objc public class CFAlertSelectionItem: NSObject {
    @objc public var title: String = ""
    @objc public var buttonSelectedImage: UIImage?
    @objc public var isSelected: Bool = false
    
    init(title: String, buttonSelectedImage: UIImage?, isSelected: Bool) {        
        self.title = title
        self.buttonSelectedImage = buttonSelectedImage
        self.isSelected = isSelected
    }
}
