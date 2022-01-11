//
//  Environment.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 10.01.2022.
//

import Foundation

private enum Consts {
    static let baseUrl = "http://kasimadalan.pe.hu/yemekler"
}

enum Environment {
    static func baseURL() -> URL {
        if let url = URL(string: Consts.baseUrl) {
            return url
        }
        return baseURL()
    }
}
