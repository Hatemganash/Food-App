//
//  OnboardingCollectionViewCell.swift
//  Food App
//
//  Created by Hatem on 14/09/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnBoardingSlide) {
        
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        
    }
    
}
