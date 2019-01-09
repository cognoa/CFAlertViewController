//
//  CFAlertActionUniqueSelectionTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 7/19/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

@objc public protocol CFAlertActionUniqueSelectionTableViewCellDelegate: class {
    func uniqueSelectionItemCellSelected(cell: CFAlertActionUniqueSelectionTableViewCell, selectionItem: CFAlertUniqueSelectionItem?)
}

public class CFAlertActionUniqueSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var selectionBorderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionImageView: UIImageView!
    
    @objc public var delegate: CFAlertActionUniqueSelectionTableViewCellDelegate?
    @objc public var selectionItem: CFAlertUniqueSelectionItem? {
        didSet {
            configureViews()
        }
    }
    
    public static func identifier() -> String {
        return String(describing: CFAlertActionUniqueSelectionTableViewCell.self)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        selectionBorderView.layer.borderWidth = 1.0
        selectionBorderView.layer.cornerRadius = 2.0
        selectionBorderView.layer.borderColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0).cgColor
        selectionImageView.image = UIImage(named: "unique-selection-deselected")
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            delegate?.uniqueSelectionItemCellSelected(cell: self, selectionItem: selectionItem)
        }
    }

    func configureViews() {
        guard let selectionItem = selectionItem else { return }
        selectionBorderView.layer.cornerRadius = 2.0
        
        if selectionItem.isSelected {
            titleLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.87)
            selectionBorderView.layer.borderColor = UIColor(red: 33.0/255.0, green: 131.0/255.0, blue: 118.0/255.0, alpha: 1.0).cgColor
            selectionImageView.image = UIImage(named: "unique-selection-selected")
            
        } else {
            titleLabel.textColor = UIColor(red: 118.0/256.0, green: 118.0/256.0, blue: 118.0/256.0, alpha: 0.87)
            selectionBorderView.layer.borderColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0).cgColor
            selectionImageView.image = UIImage(named: "unique-selection-deselected")
        }
    }
    
    @IBAction func cellButtonTapped(_ sender: Any) {
        delegate?.uniqueSelectionItemCellSelected(cell: self, selectionItem: selectionItem)
    }
}
