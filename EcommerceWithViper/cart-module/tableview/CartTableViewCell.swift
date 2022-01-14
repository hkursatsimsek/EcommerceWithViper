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
    var stepValue:Double?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let count = Int(cartFoodCount.text!), let foodTotal = Int(cartFoodTotal.text!) {
            foodCount = count
            foodPrice = foodTotal
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cartStepperAction(_ sender: UIStepper) {
        foodCount = Int(sender.value) + foodCount
        cartFoodCount.text = "Adet : \(foodCount))"
        if let price = self.foodPrice {
            cartFoodTotal.text = "\(foodCount * price) ₺"
        }
    }
    
    func setFoodImage(foodPictureName:String) {
        if let url = URL(string: "\(Environment.baseURL())/resimler/\(foodPictureName)") {
            DispatchQueue.main.async {
                self.cartImageView.kf.setImage(with: url)
            }
        }
    }
}
