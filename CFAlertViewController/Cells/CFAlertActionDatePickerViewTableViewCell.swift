//
//  CFAlertActionDatePickerViewTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 7/19/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

@objc public protocol CFAlertActionDatePickerViewTableViewCellDelegate: class {
    func datePickerCellDateSelected(cell: CFAlertActionDatePickerViewTableViewCell, date: Date, datePicker: UIDatePicker)
}

public class CFAlertActionDatePickerViewTableViewCell: UITableViewCell {
    @IBOutlet weak var datePickerView: UIDatePicker!
    public var delegate: CFAlertActionDatePickerViewTableViewCellDelegate?
    
    public static func identifier() -> String {
        return String(describing: CFAlertActionDatePickerViewTableViewCell.self)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        datePickerView.maximumDate = Date()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction public func datePickerValueChanged(_ sender: Any) {
        delegate?.datePickerCellDateSelected(cell: self, date: datePickerView.date, datePicker: datePickerView)
    }
}
