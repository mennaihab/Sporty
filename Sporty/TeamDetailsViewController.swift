//
//  TeamDetailsViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 27/05/2023.
//

import UIKit
import CoreData
import SDWebImage

class TeamDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    
    
    lazy var viewModel: TeamDetailsViewModel = {
        return TeamDetailsViewModel()
    }()
    
    var context : NSManagedObjectContext?
    var id:Int = 0
    var sportType:String?
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    var networkIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationItem.title = "Team Details"
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            context = appDelegate.persistentContainer.viewContext
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "💜", style: .done, target: self, action: #selector(addToFavourites))
        
        configureNetworkIndicator()
        getDataFromApi()
        observeViewModel()
        
    }

    @objc func addToFavourites(){
        viewModel.addToFavourites(context: context!,sportType:sportType!)
       
          }
        
    
    
    func configureNetworkIndicator(){
        
        networkIndicator.color = UIColor.blue
        networkIndicator.center = view.center
        view.addSubview(networkIndicator)
        
    }

    func getDataFromApi(){
        
        if(sportType == "football"){
            viewModel.getTeamdetailsFromApi(type:FootballTeam.self, teamId: id)
        }
        else if(sportType == "basketball"){
            viewModel.getTeamdetailsFromApi(type:BasketballTeam.self, teamId: id)
            
        }
        else if(sportType == "cricket"){
            viewModel.getTeamdetailsFromApi(type:CricketTeam.self, teamId: id)
            
        }
        else{
           // viewModel.getLeaguesFromApi(type:.self)
            
        }
    }
    
    
    func observeViewModel() {
        
        
        viewModel.updateIndicatorClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let isLoading = self?.viewModel.isLoading {
                    if isLoading {
                        self?.networkIndicator.startAnimating()
                        UIView.animate(withDuration: 0.7, animations: {
                    
                        })
                    }else {
                        self?.networkIndicator.stopAnimating()
                       
                    }
                }
            }
        }
        
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.updateTeamNameAndLogo()
            }
        }
    }
    
    
    func updateTeamNameAndLogo(){
        self.teamName.text = self.viewModel.teamName
        self.teamLogo.sd_setImage(with: URL(string: viewModel.teamLogo ?? "" ), placeholderImage: UIImage(named: "football.png"))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        teamLogo.layer.borderWidth = 1
        teamLogo.layer.borderColor = UIColor.red.cgColor
        teamLogo.layer.cornerRadius = teamLogo.frame.size.height / 2
        teamLogo.clipsToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" ,for:indexPath as! IndexPath) as! TeamDetailsViewCell
        cell.name.text = viewModel.teamArray[indexPath.row].player_name
        cell.type.text = viewModel.teamArray[indexPath.row].player_type
        cell.age.text = viewModel.teamArray[indexPath.row].player_age
        cell.logo.sd_setImage(with: URL(string: viewModel.teamArray[indexPath.row].player_image ?? "" ), placeholderImage: UIImage(named: "football.png"))
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        return cell
        
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
