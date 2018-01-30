//
//  CFAlertActionSelectionTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 1/30/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

@objc public protocol CFAlertActionSelectionTableViewCellDelegate: class {
    func selectionItemCellSelected(cell: CFAlertActionSelectionTableViewCell, selectionItem: CFAlertSelectionItem?)
}

@objc public class CFAlertActionSelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!

    @IBOutlet weak var topSeparatorView: UIView!
    @IBOutlet weak var bottomSeparatorView: UIView!
    
    @objc public var selectionItem: CFAlertSelectionItem? {
        didSet {
            titleLabel.text = selectionItem?.title
        }
    }
    
    @objc public weak var delegate: CFAlertActionSelectionTableViewCellDelegate?
    
    public static func identifier() -> String    {
        return String(describing: CFAlertActionSelectionTableViewCell.self)
    }
    
    // MARK: - Initialization Methods
    public override func awakeFromNib() {
        super.awakeFromNib()
        basicInitialisation()
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        basicInitialisation()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Layout Methods
    public override func layoutSubviews() {
        super.layoutIfNeeded()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
    
    internal func basicInitialisation() {
        let defaultImage = UIImage(named: "check-box-default")
        selectionButton.setBackgroundImage(defaultImage, for: .normal)
        let selectedImage = UIImage(named: "check-box-active")
        selectionButton.setBackgroundImage(selectedImage, for: .selected)
    }
    
    @IBAction func selectionButtonPressed(_ sender: Any) {
        selectionButton.isSelected = !selectionButton.isSelected
        print("Selection Button selected: \(selectionButton.isSelected)")
        selectionItem?.isSelected = selectionButton.isSelected
        delegate?.selectionItemCellSelected(cell: self, selectionItem: selectionItem)
    }
}
