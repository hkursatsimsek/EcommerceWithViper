//
//  FoodDetailInteractor.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 11.01.2022.
//

import Foundation
import UIKit
import Kingfisher
import Alamofire

class FoodDetailInteractor:PresenterToInteractorFoodDetailProtocol {
    var detailPresenter: InteractorToPresenterFoodDetailProtocol?

    func getFoodImage(foodPictureName: String) {
        //
    }

    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let params: Parameters = [
            "yemek_adi":yemek_adi,
            "yemek_resim_adi":yemek_resim_adi,
            "yemek_siparis_adet":yemek_siparis_adet,
            "yemek_fiyat":yemek_fiyat,
            "kullanici_adi":"kursat_simsek"
        ]

        let url = "\(Environment.baseURL())/sepeteYemekEkle.php"

        AF.request(url,method:.post, parameters: params).response { response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
