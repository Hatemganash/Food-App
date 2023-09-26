//
//  MealsViewController.swift
//  Food App
//
//  Created by Hatem on 14/09/2023.
//

import UIKit
import ProgressHUD
import SideMenu


class MealsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var populars : [Dish] = []
    var menu : SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRightBarButtom()
        setupLeftBarButtom()
        
        let layout = PinterestLayout()
        collectionView.collectionViewLayout = layout
        
        layout.delegate = self
        layout.cellPadding = 0
        layout.numberOfColumns = 2
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MealCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MealCollectionViewCell")
        collectionView.register(UINib(nibName: "FirstMealCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstMealCollectionViewCell")
        
        ProgressHUD.show()
        
        
        NetworkService.shared.fetchAllCategories { [weak self] result  in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                
                self?.populars = allDishes.populars ?? []
                self?.collectionView.reloadData()
                
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        // MARK: - Side Menu
        
        menu = SideMenuNavigationController(rootViewController: MenuListTableViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        
    }
    
    private func setupRightBarButtom(){
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "user"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action:#selector(callMethod), for: .touchUpInside)
        button.clipsToBounds = true
        // button.backgroundColor = .black
        button.imageView?.clipsToBounds = true
        button.imageView?.cornerRadius = 10
        button.cornerRadius = 5
        button.frame = CGRect(x: 0, y: 0, width: 40 , height: 40)
        view.addSubview(button)
        
        let barButton = UIBarButtonItem(customView: view)
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc func callMethod() {
        self.present(menu!, animated: true)
    }
    
    private func setupLeftBarButtom(){
        let view = UIView()
        view.frame = CGRect(x: -5, y: -10, width: 80, height: 80)
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action:#selector(callMethod1), for: .touchUpInside)
        button.clipsToBounds = true
        // button.backgroundColor = .black
        button.imageView?.clipsToBounds = true
        //button.imageView?.cornerRadius = 10
        //button.cornerRadius = 5
        button.frame = CGRect(x: -5, y: -10, width: 80 , height: 80)
        view.addSubview(button)
        
        let barButton = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = barButton
    }
    @objc func callMethod1() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let itemLayout = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(260)))
        itemLayout.contentInsets = NSDirectionalEdgeInsets(top: 4  , leading: 6, bottom: 4, trailing: 6)
        
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .estimated(360)), subitem: itemLayout, count: 2)
        
        let section = NSCollectionLayoutSection(group: groupLayout)
        
        return UICollectionViewCompositionalLayout(section: section)
        
        
    }
    
}

extension MealsViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populars.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstMealCollectionViewCell", for: indexPath) as! FirstMealCollectionViewCell
            return cell
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCollectionViewCell", for: indexPath) as! MealCollectionViewCell
            cell.setup(dish: populars[indexPath.row - 1])
            //        cell.foundResultsLabel.isHidden = indexPath.row != 0
            return cell
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        controller.dish = populars[indexPath.row - 1]
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension MealsViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return indexPath.row == 0 ? 100 : 270
        
    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return indexPath.row == 0 ? 0 : 24
    }
    
}
public extension String {
    /**
     Calculates the best height of the text for available width and font used.
     */
    func heightForWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let rect = NSString(string: self).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        )
        return ceil(rect.height)
    }
}
