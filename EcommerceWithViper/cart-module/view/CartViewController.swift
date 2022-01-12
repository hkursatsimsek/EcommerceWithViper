//
//  CartViewController.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var cartTotal: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    
    var cartList = [Cart]()
    
    var cartPresenterObject:ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        CartRouter.createModule(ref: self)
        
        cartPresenterObject?.getFoods(kullanici_adi: "kursat_simsek")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getFoods(kullanici_adi: "kursat_simsek")
    }
    

}

extension CartViewController: PresenterToViewCartProtocol {
    func sendToDataView(cartList: Array<Cart>) {
        self.cartList = cartList
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartItem = cartList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartTableViewCell
        if let cartFoodName = cartItem.yemek_adi, let cartFoodPrice = cartItem.yemek_fiyat,let cartImageName = cartItem.yemek_resim_adi, let cartItemCount = cartItem.yemek_siparis_adet {
            cell.cartFoodName.text = cartFoodName
            cell.cartFoodCount.text = "Adet : \(cartItemCount)"
            cell.setFoodImage(foodPictureName: cartImageName)
            if let cFPrice = Int(cartFoodPrice), let cICount = Int(cartItemCount) {
                cell.cartFoodTotal.text = "\(cFPrice * cICount) ₺"
            }
        }
        
        
        
        return cell
    }
    
    
}
