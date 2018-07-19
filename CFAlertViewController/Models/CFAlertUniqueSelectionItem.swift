//
//  CFUniqueSelectionItem.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 7/19/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

@objc public class CFAlertUniqueSelectionItem: NSObject {
    @objc public var title: String = ""
    @objc public var isSelected: Bool = false
    
    @objc public init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }    
}
