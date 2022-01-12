//
//  FoodDetailPresenter.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 11.01.2022.
//

import Foundation

class FoodDetailPresenter:ViewToPresenterFoodDetailProtocol {
    var detailInteractor: PresenterToInteractorFoodDetailProtocol?
    var detailView: PresenterToViewFoodDetailProtocol?

    func getImage(foodPictureName: String) {
        print("asd")
    }

    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        detailInteractor?.addToCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: "Kürşat")
    }
}
