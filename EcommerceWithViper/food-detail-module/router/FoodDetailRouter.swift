//
//  FoodDetailRouter.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 11.01.2022.
//

import Foundation

class FoodDetailRouter:PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailViewController) {
        let presenter = FoodDetailPresenter()

        ref.foodDetailPresenterObject = presenter

        ref.foodDetailPresenterObject?.detailInteractor = FoodDetailInteractor()
        ref.foodDetailPresenterObject?.detailView = ref

        ref.foodDetailPresenterObject?.detailInteractor?.detailPresenter = presenter as? InteractorToPresenterFoodDetailProtocol
    }
}
