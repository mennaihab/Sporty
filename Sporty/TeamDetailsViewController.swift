//
//  TeamDetailsViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 27/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        teamLogo.layer.borderWidth = 1
        teamLogo.layer.borderColor = UIColor.red.cgColor
        teamLogo.layer.cornerRadius = teamLogo.frame.size.height / 2
        teamLogo.clipsToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" ,for:indexPath as! IndexPath) as! TeamDetailsViewCell
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 15
        return CGSize(width: width/2, height: 300)
    }
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        
//        layer.borderWidth = 1
//        teamLogo.layer.borderColor = UIColor.red.cgColor
//        teamLogo.layer.cornerRadius = teamLogo.frame.size.height / 2
//        teamLogo.clipsToBounds = true
//        
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        homeTitle.layer.backgroundColor = UIColor.orange.cgColor
//        homeTitle.layer.cornerRadius = 40
//        homeTitle.layer.masksToBounds = true
//    }
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
