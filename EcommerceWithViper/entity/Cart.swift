//
//  Cart.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 11.01.2022.
//

import Foundation

struct Cart:Codable {
    var sepet_yemek_id:Int?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:Int?
    var yemek_siparis_adet:Int?
    var kullanici_adi:String?
}
