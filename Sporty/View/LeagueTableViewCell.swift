//
//  TableViewCell.swift
//  Sporty
//
//  Created by Menna Ihab on 22/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set cell seperators and round image inside cell
        giveSpaceBetweenCells()
        customizeImage()
    }
    
    func giveSpaceBetweenCells(){
        let cellMargins = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
         contentView.frame = contentView.frame.inset(by: cellMargins)
    }
    
    func customizeImage(){
        leagueImage.layer.borderWidth = 1
        leagueImage.layer.borderColor = UIColor.red.cgColor
        leagueImage.layer.cornerRadius = leagueImage.frame.size.height / 2
        leagueImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        
        // Configure the view for the selected state
    }
    
}
