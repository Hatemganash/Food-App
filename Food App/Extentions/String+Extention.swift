
import Foundation

extension String {
    var asUrl : URL? {
        return URL(string: self)
    }
    
}


import UIKit

extension UITableView {
    
    func registerTVCell<Cell:UITableViewCell>(cellClass: Cell.Type){
        //MARK: - Generic Register TableView Cells
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeueTVCell<Cell:UITableViewCell>() -> Cell {
        //MARK: - Generic dequeueReusableTableViewCells
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {  fatalError("Error in Cell") }
        return cell
    }
    
//    func setEmptyMessage(fileName: String = "empty_data") {
//        let viewfromXib = LottieView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
//        viewfromXib.fileName = fileName
//        backgroundView = viewfromXib
//        separatorStyle = .none
//    }
}


extension UICollectionView {
    
    func registerCell<Cell:UICollectionViewCell>(cellClass: Cell.Type ){
    //MARK: - Generic Register CollectionView Cells
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    
    func dequeue<Cell:UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        //MARK: - Generic dequeueReusableCells
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else { fatalError("Error in cell")}
    
        return cell
    }
    
//    func setEmptyMessage(fileName: String = "empty_data") {
//        let viewfromXib = LottieView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
//        viewfromXib.fileName = fileName
//        backgroundView = viewfromXib
//
    }
     

