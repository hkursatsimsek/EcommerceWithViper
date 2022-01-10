//
//  MainViewPresenter.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import Foundation

class MainViewPresenter: ViewToPresenterMainViewProtocol {
    var mainInteractor: PresenterToInteractorMainViewProtocol?
    var mainView: PresenterToViewMainViewProtocol?
    
    func getAll() {
        mainInteractor?.getAllFoods()
    }
    
    func delete(yemek_id: String) {
        mainInteractor?.deleteFood(yemek_id: yemek_id)
    }
}

extension MainViewPresenter: InteractorToPresenterMainViewProtocol {
    func sendDataToPresenter(foodList: Array<Food>) {
        mainView?.sendToDataView(foodList: foodList)
    }
}
