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
        let params:Parameters = [
            "sepet_yemek_id":sepet_yemek_id,
            "kullanici_adi":kullanici_adi
        ]
        
        let url = "\(Environment.baseURL())/sepettenYemekSil.php"
        
        AF.request(url,method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.getCartFoods(kullanici_adi: kullanici_adi)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
