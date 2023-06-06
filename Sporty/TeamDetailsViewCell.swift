//
//  TeamDetailsViewCell.swift
//  Sporty
//
//  Created by Menna Ihab on 27/05/2023.
//

import UIKit

class TeamDetailsViewCell: UICollectionViewCell {
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logo.layer.borderWidth = 1
        logo.layer.borderColor = UIColor.orange.cgColor
        logo.layer.cornerRadius = logo.frame.size.height / 2
        logo.clipsToBounds = true
    }

}
