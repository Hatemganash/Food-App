//
//  FooterTabelView.swift
//  Food App
//
//  Created by Hatem on 17/09/2023.
//

import Foundation
import UIKit


class TableFooter : UITableViewHeaderFooterView {
    
    static let identifier = "TableFooter"
    
    private let logOut : UIButton = {
        
//             let view = UIView()
//                view.frame = CGRect(x: 24, y: 130, width: 250, height: 150)
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor(red: 1, green: 0.45, blue: 0.3, alpha: 1)
        button.clipsToBounds = true
        button.cornerRadius = 22
        button.frame = CGRect(x: 24, y: 90, width: 250 , height: 150)
        button.setImage(UIImage(named: "LogOut"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 9, left: 12, bottom: 9, right: 12)
    
        button.setTitle(" Log Out", for: .normal)
      //  button.heightAnchor.constraint(equalToConstant: 150).isActive = true
      //  button.autoresizingMask = [.flexibleWidth , .flexibleHeight]
       // view.addSubview(button)
    
        return button
        
        
    }()
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(logOut)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        logOut.sizeToFit()
        
        
    }
}
