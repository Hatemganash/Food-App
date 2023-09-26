//
//  MenuListViewController.swift
//  Food App
//
//  Created by Hatem on 17/09/2023.
//

import UIKit

class MenuListViewController: UIViewController  {
    
    @IBOutlet weak var tabelView: UITableView!
    
    var items = ["First" , "Secound" , "Third","First" , "Secound" , "Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: TableViewCell.identifier, bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: TableViewCell.identifier)
        
        //     registerCells()
        // Do any additional setup after loading the view.
    }
}
//    private func registerCells () {
//        tabelView.register(UINib(nibName: TableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
//
////        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//                           }
//
//
//
//}

extension MenuListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath
//        ) as! TableViewCell
//        cell.menuTitle.text = items[indexPath.row]
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
