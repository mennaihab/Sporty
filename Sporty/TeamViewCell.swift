//
//  TeamViewCell.swift
//  Sporty
//
//  Created by Menna Ihab on 30/05/2023.
//

import UIKit

class TeamViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamLogo: UIImageView!
    override func layoutSubviews() {
        super.layoutSubviews()
        teamLogo.layer.borderWidth = 1
        teamLogo.layer.borderColor = UIColor.red.cgColor
        teamLogo.layer.cornerRadius = teamLogo.frame.size.height / 2
        teamLogo.clipsToBounds = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
