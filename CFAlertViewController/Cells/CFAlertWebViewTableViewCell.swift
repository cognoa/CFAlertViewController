//
//  CFAlertWebViewTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Jonathan Torrens on 3/16/18.
//  Copyright © 2018 Codigami Inc. All rights reserved.
//

import UIKit
import WebKit

@objc public class CFAlertWebViewTableViewCell: UITableViewCell {
    @objc var webView: WKWebView! {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        self.contentView.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([webView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
                                     webView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0),
                                     webView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0),
                                     webView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0)
            ])
        self.contentView.setNeedsLayout()
    }
    @objc public static func identifier() -> String    {
        return String(describing: CFAlertWebViewTableViewCell.self)
    }
}

