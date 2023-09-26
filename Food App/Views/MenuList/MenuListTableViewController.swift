//
//  MenuListTableViewController.swift
//  Food App
//
//  Created by Hatem on 17/09/2023.
//

import UIKit




class MenuListTableViewController: UITableViewController {
    
    let items = [
        line(image: "Orders", name: "My Orders") ,
        line(image: "Profile", name: "My Profile") ,
        line(image: "Location", name: "Delivery Address") ,
        line(image: "Wallet", name: "Payment Methods") ,
        line(image: "Message", name: "Contact Us") ,
        line(image: "Setting1", name: "Settings") ,
        line(image: "Helps", name: "Helps & FAQs")
        
    ]
    // var items = ["My Orders" , "My Profile" , "Delivery Address","Payment Methods" , "Contact Us" , "Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: "footer")
        tableView.separatorStyle = .none
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let item = items[indexPath.row]
        cell.infoImage.image = UIImage(named: item.image)
        cell.infoLabel.text = item.name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer")
        return footer
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
}
    
    class CustomCell : UITableViewCell {
        let infoImage = UIImageView()
        let infoLabel = UILabel()
    
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(infoImage)
        addSubview(infoLabel)
    infoImage.frame = CGRect(x: 20, y: 14, width: 20, height: 20)
    infoLabel.frame = CGRect(x: 55, y: 10, width: 140, height: 30)

    }
required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    }


struct line {
    var image : String
    var name : String
}
