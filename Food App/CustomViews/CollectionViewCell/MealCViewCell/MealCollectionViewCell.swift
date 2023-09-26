//
//  MealCollectionViewCell.swift
//  Food App
//
//  Created by Hatem on 15/09/2023.
//


import UIKit
import Kingfisher

class MealCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setup(dish : Dish) {
        
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        priceLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
}
