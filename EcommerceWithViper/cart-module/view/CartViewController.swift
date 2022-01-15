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
    
    public static var total:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        CartRouter.createModule(ref: self)
        
        cartPresenterObject?.getFoods(kullanici_adi: "kursat_simsek")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getFoods(kullanici_adi: "kursat_simsek")
        cartTotal.text = "TOPLAM : 0"
    }
    
    @IBAction func returnButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
}

extension CartViewController: PresenterToViewCartProtocol {
    func sendToDataView(cartList: Array<Cart>) {
        DispatchQueue.main.async {
            self.cartList = cartList
            var totalPrice = 0
            self.cartTableView.reloadData()
            for i in cartList {
                totalPrice = totalPrice + (Int(i.yemek_fiyat!)! * Int(i.yemek_siparis_adet!)!)
            }
            self.cartTotal.text = "TOPLAM : \(totalPrice) ₺"
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
                cell.foodPrice = cFPrice
                cell.foodCount = cICount
                
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let food = self.cartList[indexPath.row]
           
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(food.yemek_adi!) silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in}
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                guard let cartId = food.sepet_yemek_id else { return }
                guard let intCartId = Int(cartId) else { return }
                self.cartPresenterObject?.deleteFood(sepet_yemek_id: intCartId, kullanici_adi: food.kullanici_adi ?? "kursat_simsek")
                
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
