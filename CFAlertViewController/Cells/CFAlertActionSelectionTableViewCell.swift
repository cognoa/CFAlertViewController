//
//  CFAlertActionSelectionTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 1/30/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

public protocol CFAlertActionSelectionTableViewCellDelegate: class {
    func selectionItemCellSelected(cell: CFAlertActionSelectionTableViewCell, selectionItem: CFAlertSelectionItem?)
}

public class CFAlertActionSelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    
    public var selectionItem: CFAlertSelectionItem? {
        didSet {
            titleLabel.text = selectionItem?.title
            selectionButton.setImage(selectionItem?.buttonSelectedImage, for: .selected)
        }
    }
    
    public weak var delegate: CFAlertActionSelectionTableViewCellDelegate?
    
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
    
    internal func basicInitialisation() {        
        selectionButton.layer.cornerRadius = 4.0
        selectionButton.layer.borderColor = UIColor(red: 147.0/255.0, green: 149.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
    }
    
    @IBAction func selectionButtonPressed(_ sender: Any) {
        print("Selection Button selected: \(selectionButton.isSelected)")
        delegate?.selectionItemCellSelected(cell: self, selectionItem: selectionItem)
    }
}
