//
//  CartPresenter.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 13.01.2022.
//

import Foundation

class CartPresenter:ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func getFoods(kullanici_adi: String) {
        cartInteractor?.getCartFoods(kullanici_adi: kullanici_adi)
    }
    
    func deleteFood(sepet_yemek_id: Int, kullanici_adi: String) {
        cartInteractor?.deleteCartFood(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}

extension CartPresenter:InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList: Array<Cart>) {
        cartView?.sendToDataView(cartList: cartList)
    } 
}
