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
    var foodCount:Int = 0
    var foodDetailPresenterObject:ViewToPresenterFoodDetailProtocol?
    var cartList = [Cart]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let food = food {
            if let foodName = food.yemek_adi, let foodPrice = food.yemek_fiyat, let foodImageName = food.yemek_resim_adi {
                detailFoodName.text = foodName
                detailFoodPrice.text = "\(foodPrice) ₺"
                self.setFoodImage(foodPictureName: foodImageName)
            }
        }
        
        FoodDetailRouter.createModule(ref: self)

        detailStepper.wraps = true
        detailStepper.autorepeat = true
        detailStepper.maximumValue = 10

    }

    @IBAction func addToCart(_ sender: Any) {
        if let food = food {
            if let foodName = food.yemek_adi, let foodPrice = food.yemek_fiyat, let foodImageName = food.yemek_resim_adi {
                foodDetailPresenterObject?.addToCart(yemek_adi: foodName, yemek_resim_adi: foodImageName, yemek_fiyat: foodPrice, yemek_siparis_adet: String(self.foodCount), kullanici_adi: "Kürşat")
            }
        }
    }

    @IBAction func stepperAction(_ sender: UIStepper) {
        foodCount = Int(sender.value)
        detailFoodCount.text = "Adet : \(Int(sender.value).description)"
    }
    
    func setFoodImage(foodPictureName:String) {
        if let url = URL(string: "\(Environment.baseURL())/resimler/\(foodPictureName)") {
            DispatchQueue.main.async {
                self.detailImageView.kf.setImage(with: url)
            }
        }
    }
    
}

extension FoodDetailViewController: PresenterToViewFoodDetailProtocol {
    func sendToDataView(cart: Array<Cart>) {
        self.cartList = cart
    }
}
