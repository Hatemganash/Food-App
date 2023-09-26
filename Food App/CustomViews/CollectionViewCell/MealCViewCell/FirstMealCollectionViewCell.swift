//
//  FirstMealCollectionViewCell.swift
//  Food App
//
//  Created by Hatem on 26/09/2023.
//

import UIKit

class FirstMealCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foundLabel: UILabel!
    var cellHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foundLabel.text = "Found \(30) results"
        cellHeight = foundLabel.text?.heightForWidth(width: foundLabel.frame.width, font: .systemFont(ofSize: 30, weight: .bold)) ?? 0.0
        
    }

}
