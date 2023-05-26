//
//  ViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 21/05/2023.
//

import UIKit

class HomeViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var homeTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var viewModel: LeagueViewModel = {
        return LeagueViewModel()
    }()
    var sprortsNames = ["Football","Basketball","Cricket","tennis"]
    var sportsImages = ["football.png","basketball.png","cricket.png","tennis.png"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sprortsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" ,for:indexPath as! IndexPath) as! SportsCollectionViewCell
        cell.sportName.text = sprortsNames[indexPath.row]
        cell.sportImage.image = UIImage(named: sportsImages[indexPath.row])
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
          //  viewModel.getFootballLeaguesFromApi()
        }
        print(indexPath.row)
     
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
            cell.contentView.backgroundColor = UIColor.orange
        }
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
            cell.contentView.backgroundColor = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 15
        return CGSize(width: width/2, height: 200)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeTitle.layer.backgroundColor = UIColor.orange.cgColor
        homeTitle.layer.cornerRadius = 40
        homeTitle.layer.masksToBounds = true
    }
  


}

