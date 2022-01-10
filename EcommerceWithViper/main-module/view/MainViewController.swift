//
//  ViewController.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 9.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var foodList = [Food]()
    
    var mainViewPresenterObject:ViewToPresenterMainViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        MainViewRouter.createModule(ref: self)
        
        mainViewPresenterObject?.getAll()
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 5
        
        let width = foodCollectionView.frame.size.width
        let cellWidth = (width - 30)/2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.6)
        
        foodCollectionView!.collectionViewLayout = design
    }


}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let food = sender as? Food
            let destination = segue.destination as! FoodDetailViewController
            destination.food = food
        }
    }
}

extension MainViewController: PresenterToViewMainViewProtocol {
    func sendToDataView(foodList: Array<Food>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.foodCollectionView.reloadData()
        }

    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foodList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell
        if let foodName = food.yemek_adi, let foodPrice = food.yemek_fiyat, let foodImageName = food.yemek_resim_adi {
            cell.foodNameLabel.text = foodName
            cell.foodPriceLabel.text = "\(foodPrice) ₺"
            cell.setFoodImage(foodPictureName: foodImageName)
        }
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 5.0
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}

