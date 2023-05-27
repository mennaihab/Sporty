//
//  LeagueDetailsViewCell.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import UIKit

class LeagueDetailsViewCell: UICollectionViewCell {

    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var finalResult: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var firstTeamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
