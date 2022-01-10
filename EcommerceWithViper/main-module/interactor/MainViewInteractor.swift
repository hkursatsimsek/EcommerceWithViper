//
//  MainViewInteractor.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import Foundation
import Alamofire

class MainViewInteractor:PresenterToInteractorMainViewProtocol {
    var mainPresenter: InteractorToPresenterMainViewProtocol?
    
    func getAllFoods() {
        guard let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php") else {return}
        
        AF.request(url,method: .get).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(FoodResponse.self, from: data)
                    var list = [Food]()
                    if let resultList = result.yemekler {
                        list = resultList
                    }
                    self.mainPresenter?.sendDataToPresenter(foodList: list)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteFood(yemek_id:String) {
        print("\(yemek_id) silindi")
    }
    
    
}
