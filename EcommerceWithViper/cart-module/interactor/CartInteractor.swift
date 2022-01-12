//
//  CartInteractor.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 13.01.2022.
//

import Foundation
import Alamofire

class CartInteractor:PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    func getCartFoods(kullanici_adi: String) {
        let param:Parameters = ["kullanici_adi":kullanici_adi]
        
        let url = "\(Environment.baseURL())/sepettekiYemekleriGetir.php"
        
        AF.request(url,method: .post,parameters: param).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(CartResponse.self, from: data)
                    var list = [Cart]()
                    if let resultList = result.sepet_yemekler {
                        list = resultList
                    }
                    self.cartPresenter?.sendDataToPresenter(cartList: list)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteCartFood(sepet_yemek_id: Int, kullanici_adi: String) {
        print("\(sepet_yemek_id) silindi")
    }
    
    
}
