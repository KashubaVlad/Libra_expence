//
//  VievModel.swift
//  Libra расходы
//
//  Created by Vlad on 18.05.2022.
//

import Foundation
import UIKit

struct Item {
    var name: String
    var price: Int
    var image: UIImage
    ///    var date: Date
    var notes: String
    
    init(name: String, price: Int, image: UIImage, notes: String) {
        self.name = name
        self.price = price
        self.image = image
        ///        self.date = date
        self.notes = notes
    }
    
}


var totalMinus = 0
