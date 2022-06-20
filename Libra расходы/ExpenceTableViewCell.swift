//
//  ExpenceTableViewCell.swift
//  Libra расходы
//
//  Created by Vlad on 25.05.2022.
//

import UIKit

class ExpenceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ExpenceLabelName: UILabel!
    @IBOutlet weak var ExpenceLabeQuantity: UILabel!
///    @IBOutlet weak var ExpenceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
