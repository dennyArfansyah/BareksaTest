//
//  FirstCell.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit

class FirstCell: UITableViewCell {
    
    @IBOutlet weak var valueItem1Label: UILabel!
    @IBOutlet weak var valueItem2Label: UILabel!
    @IBOutlet weak var valueItem3Label: UILabel!
    
    static let reusedIdentifier = String(describing: FirstCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
