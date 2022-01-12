//
//  FoodDetailProtocols.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 11.01.2022.
//

import Foundation

protocol PresenterToInteractorFoodDetailProtocol {
    var detailPresenter:InteractorToPresenterFoodDetailProtocol? {get set}

    func getFoodImage(foodPictureName:String)
    func addToCart(yemek_adi:String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol ViewToPresenterFoodDetailProtocol {
    var detailInteractor:PresenterToInteractorFoodDetailProtocol? {get set}
    var detailView:PresenterToViewFoodDetailProtocol? {get set}

    func getImage(foodPictureName:String)
    func addToCart(yemek_adi:String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol InteractorToPresenterFoodDetailProtocol {
    func sendDataToPresenter(cart:Array<Cart>)
}

protocol PresenterToViewFoodDetailProtocol {
    func sendToDataView(cart:Array<Cart>)
}

protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref:FoodDetailViewController)
}
