//
//  MainViewRouter.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import Foundation

class MainViewRouter: PresenterToRouterMainViewProtocol {
    static func createModule(ref: MainViewController) {
        let presenter = MainViewPresenter()
        
        ref.mainViewPresenterObject = presenter
        
        ref.mainViewPresenterObject?.mainInteractor = MainViewInteractor()
        ref.mainViewPresenterObject?.mainView = ref
        
        ref.mainViewPresenterObject?.mainInteractor?.mainPresenter = presenter
    }
}
