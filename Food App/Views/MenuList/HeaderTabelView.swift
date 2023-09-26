//
//  HeaderTabelView.swift
//  Food App
//
//  Created by Hatem on 17/09/2023.
//


import UIKit

class TableHeader : UITableViewHeaderFooterView {
    
    static let identifier = "TableHeader"
    private let imageView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: 70, y: 0, width: 90, height: 90)
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 70, y: 0, width: 90 , height: 90)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "user")
        imageView.layer.cornerRadius = 25
        imageView.cornerRadius =  45
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        return view
        
    }()
    
    private let label : UILabel = {
       
        let label = UILabel()
        label.text = "Hatem Ganash"
        label.font = UIFont(name: "SofiaPro-SemiBold", size: 20)
        // Line height: 20 pt
        label.textAlignment = .left
        return label
        
    }()
    private let email : UILabel = {
       
        let email = UILabel()
        email.text = "HatemGanash98@gmail.com"
        email.font = .systemFont(ofSize: 12, weight: .light)
        email.textColor = .gray
        email.textAlignment = .left
        return email
        
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(email)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        email.sizeToFit()
        label.frame = CGRect(x: 25,
                             y: contentView.frame.size.height-110
                             //-label.frame.size.height
                             ,
                             width: contentView.frame.size.width,
                             height: contentView.frame.size.height)
        email.frame = CGRect(x: 25,
                             y: contentView.frame.size.height-90
                             //-label.frame.size.height
                             ,
                             width: contentView.frame.size.width,
                             height: contentView.frame.size.height)
        imageView.frame = CGRect(x: -40, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-50
                                 //-label.frame.size.height
        )
    }
    
}
