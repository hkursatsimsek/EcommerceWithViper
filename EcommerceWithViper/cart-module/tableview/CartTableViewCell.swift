//
//  CartTableViewCell.swift
//  EcommerceWithViper
//
//  Created by Kürşat Şimşek on 13.01.2022.
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartFoodName: UILabel!
    @IBOutlet weak var cartFoodCount: UILabel!
    @IBOutlet weak var cartFoodTotal: UILabel!
    @IBOutlet weak var cartStepperOutlet: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cartStepperAction(_ sender: Any) {
    }
    
    func setFoodImage(foodPictureName:String) {
        if let url = URL(string: "\(Environment.baseURL())/resimler/\(foodPictureName)") {
            DispatchQueue.main.async {
                self.cartImageView.kf.setImage(with: url)
            }
        }
    }
}
