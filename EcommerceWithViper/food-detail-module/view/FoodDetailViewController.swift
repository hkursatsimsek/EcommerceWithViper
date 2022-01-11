//
//  FoodDetailViewController.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import UIKit
import Kingfisher
import SwiftUI

class FoodDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailFoodName: UILabel!
    @IBOutlet weak var detailFoodPrice: UILabel!
    @IBOutlet weak var detailFoodCount: UILabel!
    @IBOutlet weak var detailStepper: UIStepper!
    
    var food:Food?
    var foodCount:Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let food = food {
            if let foodName = food.yemek_adi, let foodPrice = food.yemek_fiyat, let foodImageName = food.yemek_resim_adi {
                detailFoodName.text = foodName
                detailFoodPrice.text = "\(foodPrice) ₺"
                self.setFoodImage(foodPictureName: foodImageName)
            }
        }
        
    }

    @IBAction func addToCart(_ sender: Any) {
        
    }
    
    func setFoodImage(foodPictureName:String) {
        if let url = URL(string: "\(Environment.baseURL())/resimler/\(foodPictureName)") {
            DispatchQueue.main.async {
                self.detailImageView.kf.setImage(with: url)
            }
        }
    }
    
}
