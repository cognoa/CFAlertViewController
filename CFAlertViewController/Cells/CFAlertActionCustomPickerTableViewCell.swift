//
//  CFAlertActionCustomPickerTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 7/31/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit

public protocol CFAlertActionCustomPickerTableViewCellDelegate: class {
    func customPickerViewDidSelectRow(row: Int, pickerView: UIPickerView)
}
public class CFAlertActionCustomPickerTableViewCell: UITableViewCell {
    @IBOutlet weak var pickerView: UIPickerView!
    public weak var delegate: CFAlertActionCustomPickerTableViewCellDelegate?

    public static func identifier() -> String {
        return String(describing: CFAlertActionCustomPickerTableViewCell.self)
    }
    
    var pickerViewOptions: [String] = [String]() {
        didSet {
            print("Did set picker options")
            print(pickerViewOptions)
            pickerView.reloadAllComponents()
        }
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        pickerView.delegate = self
    }
    
    func configureViews() {
        
    }

    override public  func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CFAlertActionCustomPickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewOptions.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewOptions[row]
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.customPickerViewDidSelectRow(row: row, pickerView: pickerView)
    }
}
