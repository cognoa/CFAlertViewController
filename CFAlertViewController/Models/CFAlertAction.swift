//
//  CFAlertAction.swift
//  CFAlertViewControllerDemo
//
//  Created by Shardul Patel on 18/01/17.
//  Copyright © 2017 Codigami Inc. All rights reserved.
//

import UIKit


open class CFAlertAction: NSObject, NSCopying {
    
    // MARK: - Declarations
    public typealias CFAlertActionHandlerBlock = (_ action: CFAlertAction) -> ()
    
    @objc public enum CFAlertActionStyle: Int {
        case Default = 0
        case Cancel
        case Destructive
    }
    
    @objc public enum CFAlertActionAlignment: Int {
        case justified = 0
        case right
        case left
        case center
    }
    
    // MARK: - Variables
    @objc public var title: String?
    @objc public var style: CFAlertActionStyle = .Default
    @objc public var alignment: CFAlertActionAlignment = .justified
    @objc public var backgroundColor: UIColor?
    @objc public var textColor: UIColor?
    @objc public var borderColor: UIColor?
    @objc public var borderWidth: CGFloat = 0
    @objc public var font: UIFont?
    @objc public var handler: CFAlertActionHandlerBlock?
    
    
    // MARK: - Initialisation Method
    @objc public class func action(title: String?,
                                   style: CFAlertActionStyle,
                                   alignment: CFAlertActionAlignment,
                                   backgroundColor: UIColor?,
                                   textColor: UIColor?,
                                   borderColor: UIColor?,
                                   borderWidth: CGFloat = 0,
                                   font: UIFont?,
                                   handler: CFAlertActionHandlerBlock?) -> CFAlertAction  {
        
        return CFAlertAction.init(title: title,
                                  style: style,
                                  alignment: alignment,
                                  backgroundColor: backgroundColor,
                                  textColor: textColor,
                                  borderColor: borderColor,
                                  borderWidth: borderWidth,
                                  font: font,
                                  handler: handler)
    }
    
    @objc public override init() {
        super.init()
    }

    @objc public convenience init(title: String?,
                                  style: CFAlertActionStyle,
                                  alignment: CFAlertActionAlignment,
                                  backgroundColor: UIColor?,
                                  textColor: UIColor?,
                                  handler: CFAlertActionHandlerBlock?) {
        self.init(title: title,
                  style: style,
                  alignment: alignment,
                  backgroundColor: backgroundColor,
                  textColor: textColor,
                  borderColor: nil,
                  borderWidth: 0,
                  font: nil,
                  handler: handler)
    }

    @objc public convenience init(title: String?,
                                  style: CFAlertActionStyle,
                                  alignment: CFAlertActionAlignment,
                                  backgroundColor: UIColor?,
                                  textColor: UIColor?,
                                  borderColor: UIColor?,
                                  borderWidth: CGFloat,
                                  font: UIFont?,
                                  handler: CFAlertActionHandlerBlock?) {
        
        // Create New Instance Of Alert Controller
        self.init()
        
        // Set Alert Properties
        self.title = title
        self.style = style
        self.alignment = alignment
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderColor = borderColor ?? UIColor.clear
        self.borderWidth = borderWidth
        self.font = font
        self.handler = handler
    }
    
    
    // MARK: - NSCopying
    public func copy(with zone: NSZone? = nil) -> Any {
        return CFAlertAction.init(title: title,
                                  style: style,
                                  alignment: alignment,
                                  backgroundColor: backgroundColor,
                                  textColor: textColor,
                                  borderColor: nil,
                                  borderWidth: 0,
                                  font: nil,
                                  handler: handler)
    }
    
    // MARK: - Dealloc
    deinit {
        
        // Remove Action Handler
        handler = nil
    }
}
