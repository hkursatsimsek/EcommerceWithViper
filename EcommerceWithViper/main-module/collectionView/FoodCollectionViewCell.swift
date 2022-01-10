//
//  FoodCollectionViewCell.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import UIKit
import Kingfisher

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    func setFoodImage(foodPictureName:String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foodPictureName)") {
            DispatchQueue.main.async {
                self.foodImageView.kf.setImage(with: url)
            }
        }
    }
    
}
