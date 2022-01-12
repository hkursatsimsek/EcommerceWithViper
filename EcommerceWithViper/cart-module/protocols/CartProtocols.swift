//
//  CartProtocols.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 13.01.2022.
//

import Foundation

protocol PresenterToInteractorCartProtocol {
    var cartPresenter:InteractorToPresenterCartProtocol? {get set}
    
    func getCartFoods(kullanici_adi:String)
    func deleteCartFood(sepet_yemek_id:Int, kullanici_adi:String)
}

protocol ViewToPresenterCartProtocol {
    var cartInteractor:PresenterToInteractorCartProtocol? {get set}
    var cartView:PresenterToViewCartProtocol? {get set}
    
    func getFoods(kullanici_adi:String)
    func deleteFood(sepet_yemek_id:Int, kullanici_adi:String)
}

protocol InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList:Array<Cart>)
}

protocol PresenterToViewCartProtocol {
    func sendToDataView(cartList:Array<Cart>)
}

protocol PresenterToRouterCartProtocol {
    static func createModule(ref:CartViewController)
}
