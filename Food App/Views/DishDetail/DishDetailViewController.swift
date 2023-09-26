//
//  DishDetailViewController.swift
//  Food App
//
//  Created by Hatem on 17/09/2023.
//

import UIKit

class DishDetailViewController: UIViewController {
    

    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var dish : Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
        setupLeftBarButtom()

    }
    
    private func populateView () {
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
    }
    private func setupLeftBarButtom(){
        let view = UIView()
        view.frame = CGRect(x: -5, y: -5, width: 80, height: 80)
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action:#selector(callMethod1), for: .touchUpInside)
        button.clipsToBounds = true
       // button.backgroundColor = .black
        button.imageView?.clipsToBounds = true
        //button.imageView?.cornerRadius = 10
        //button.cornerRadius = 5
        button.frame = CGRect(x: -5, y: -5, width: 80 , height: 80)
        view.addSubview(button)
        
        let barButton = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = barButton
    }
    @objc func callMethod1() {
        navigationController?.popViewController(animated: true)
    }
    

}
