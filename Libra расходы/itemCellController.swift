//
//  itemCellController.swift
//  Libra расходы
//
//  Created by Vlad on 20.06.2022.
//

import Foundation
import UIKit


class ItemCellController: UIViewController {
    var name = "name"
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var price = 0
    @IBOutlet weak var priceLabel: UILabel!
    
    var notes = " "
    @IBOutlet weak var notesLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectOutlet()
        
    }
    
    
    
    
    func connectOutlet() {
        nameLabel.text = name
        priceLabel.text = String(price)
        notesLabel.text = notes
    }
    
}





