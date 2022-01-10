//
//  MainViewProtocols.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import Foundation

protocol PresenterToInteractorMainViewProtocol {
    var mainPresenter:InteractorToPresenterMainViewProtocol? {get set}
    
    func getAllFoods()
    func deleteFood(yemek_id:String)
    
}

protocol ViewToPresenterMainViewProtocol {
    var mainInteractor:PresenterToInteractorMainViewProtocol? {get set}
    var mainView:PresenterToViewMainViewProtocol? {get set}
    
    func getAll()
    func delete(yemek_id:String)
}

protocol InteractorToPresenterMainViewProtocol {
    func sendDataToPresenter(foodList:Array<Food>)
}

protocol PresenterToViewMainViewProtocol {
    func sendToDataView(foodList:Array<Food>)
}

protocol PresenterToRouterMainViewProtocol {
    static func createModule(ref:MainViewController)
}
