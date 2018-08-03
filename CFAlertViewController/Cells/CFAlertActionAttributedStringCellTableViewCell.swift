//
//  CFAlertActionAttributedStringCellTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 8/3/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

class CFAlertActionAttributedStringCellTableViewCell: UITableViewCell {

    @IBOutlet weak var attributedLabel: UILabel!

    public static func identifier() -> String {
        return String(describing: CFAlertActionAttributedStringCellTableViewCell.self)
    }

    public var attributedTitle: NSAttributedString? {
        didSet {
            attributedLabel.attributedText = attributedTitle
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
}
