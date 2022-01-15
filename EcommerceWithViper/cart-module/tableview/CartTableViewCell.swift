//
//  CartTableViewCell.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 13.01.2022.
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartFoodName: UILabel!
    @IBOutlet weak var cartFoodCount: UILabel!
    @IBOutlet weak var cartFoodTotal: UILabel!
    @IBOutlet weak var cartStepperOutlet: UIStepper!
    
    var foodCount:Int = 1
    var foodPrice:Int?
    static var totalPrice:Int = 0
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cartStepperAction(_ sender: UIStepper) {
        if (foodCount == 1) {
            foodCount = Int(sender.value) + 1
        } else if ( foodCount > 1 ) {
            foodCount += 1
        }
        
        cartFoodCount.text = "Adet : \(foodCount)"
        if let price = self.foodPrice {
            cartFoodTotal.text = "\(foodCount * price) ₺"
        }
        
        
    }
    
    func setFoodImage(foodPictureName:String) {
        if let url = URL(string: "\(Environment.baseURL())/resimler/\(foodPictureName)") {
            DispatchQueue.main.async {
                self.cartImageView.kf.setImage(with: url)
                if let total = Int(self.cartFoodTotal.text ?? "") {
                    CartTableViewCell.totalPrice += total
                }
            }
        }
    }
}
