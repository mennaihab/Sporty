//
//  LeagueAllDetailsViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 27/05/2023.
//

import UIKit

class LeagueAllDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var sportType :String?
    var id :Int = 0
    var networkIndicator = UIActivityIndicatorView(style: .large)
    
    lazy var viewModel: LeagueDetailsViewModel = {
        return LeagueDetailsViewModel()
    }()
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.LatestCollectionView {
            return viewModel.numberOfLatestCells
        }
        else if collectionView == self.upComingCollectionView{
            return viewModel.numberOfUpComingCells
        }
        else{
            return viewModel.numberOfTeamsCells
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.LatestCollectionView ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueDetailsViewCell
            cell.firstTeamName.text = viewModel.LatestArray[indexPath.row].firstTeam
            cell.secondTeamName.text = viewModel.LatestArray[indexPath.row].secondTeam
            cell.gameTime.text = viewModel.LatestArray[indexPath.row].time
            cell.gameDate.text = viewModel.LatestArray[indexPath.row].date
            cell.finalResult.text = viewModel.LatestArray[indexPath.row].gameResult
            if(sportType == "football"){
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "football.png"))
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "football.png"))
            }
            else if (sportType == "basketball"){
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "basketball.png"))
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "basketball.png"))
                
            }
            else if(sportType == "cricket"){
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "cricket.png"))
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "cricket.png"))
                
            }
            else{
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "tennis.png"))
                print(viewModel.LatestArray[indexPath.row].firstTeam)
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.LatestArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "tennis.png"))
                
                
            }
            return cell
        }
        
        else if (collectionView == self.upComingCollectionView ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueDetailsViewCell
            cell.firstTeamName.text = viewModel.upComingArray[indexPath.row].firstTeam
            cell.secondTeamName.text = viewModel.upComingArray[indexPath.row].secondTeam
            cell.gameTime.text = viewModel.upComingArray[indexPath.row].time
            cell.gameDate.text = viewModel.upComingArray[indexPath.row].date
            cell.finalResult.text = viewModel.upComingArray[indexPath.row].gameResult
            
            if(sportType == "football"){
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "football.png"))
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "football.png"))
            }
            else if (sportType == "basketball"){
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "basketball.png"))
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "basketball.png"))
                
            }
            else if(sportType == "cricket"){
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "cricket.png"))
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "cricket.png"))
                
            }
            else{
                cell.firstTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].firstTemaLogo ?? "" ), placeholderImage: UIImage(named: "tennis.png"))
                
                cell.secondTeamImage.sd_setImage(with: URL(string: viewModel.upComingArray[indexPath.row].secondTeamLogo ?? "" ), placeholderImage: UIImage(named: "tennis.png"))
                
            }
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamViewCell
        
            if(sportType == "football"){
                cell.teamLogo.sd_setImage(with: URL(string: viewModel.teamsArray[indexPath.row].logo ?? "" ), placeholderImage: UIImage(named: "football.png"))
                
            }
            else if (sportType == "basketball"){
                cell.teamLogo.sd_setImage(with: URL(string: viewModel.teamsArray[indexPath.row].logo ?? "" ), placeholderImage: UIImage(named: "basketball.png"))
                
                
            }
            else if(sportType == "cricket"){
                cell.teamLogo.sd_setImage(with: URL(string: viewModel.teamsArray[indexPath.row].logo ?? "" ), placeholderImage: UIImage(named: "cricket.png"))
                
                
            }
            else{
                cell.teamLogo.sd_setImage(with: URL(string: viewModel.teamsArray[indexPath.row].logo ?? "" ),  placeholderImage: UIImage(named: "tennis.png"))
                
                
                
            }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView == self.LatestCollectionView || collectionView == self.upComingCollectionView){
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.orange.cgColor
            cell.layer.cornerRadius = 30
            cell.clipsToBounds = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == self.LatestCollectionView || collectionView == self.upComingCollectionView){
            let width = collectionView.frame.size.width - 15
            return CGSize(width: width/3, height: 150)
        }
        else{
            return CGSize(width:50, height: 50)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.teamsCollectionView {
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "teamDetails") as! TeamDetailsViewController
        vc.sportType = self.sportType
            vc.id = viewModel.teamsArray[indexPath.row].id!
        navigationController?.pushViewController(vc, animated: true)
    }
           }
    
    
    func configureNetworkIndicator(){
        
        networkIndicator.color = UIColor.blue
        networkIndicator.center = view.center
        view.addSubview(networkIndicator)
        
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
        
        viewModel.reloadLatestClosure = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.LatestCollectionView.reloadData()
            }
        }
        
        viewModel.reloadUpComingClosure = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.upComingCollectionView.reloadData()
            }
        }
        
        viewModel.reloadteamsClosure = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.teamsCollectionView.reloadData()
            }
        }
        
        
    }
    
    
    
    
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    @IBOutlet weak var LatestCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("class id of details controller")
        print(self.id)
        teamsCollectionView.delegate = self
        upComingCollectionView.delegate = self
        LatestCollectionView.delegate = self
        
        
        teamsCollectionView.dataSource = self
        upComingCollectionView.dataSource = self
        LatestCollectionView.dataSource = self
        
        
        self.upComingCollectionView!.register(UINib(nibName: "LeagueDetailsViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        self.LatestCollectionView!.register(UINib(nibName: "LeagueDetailsViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        self.teamsCollectionView!.register(UINib(nibName: "TeamViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        navigationItem.title = "League Details"
        // viewModel.getLatestFromApi(type: CricketEvent.Type, leagId: 200)
        
        configureNetworkIndicator()
        if(sportType == "football")
        {
            viewModel.getLatestFromApi(type: FootballEvent.self, leagId: id)
                        viewModel.getUpComingFromApi(type: FootballEvent.self, leagId: id)
                        viewModel.getTeamsFromApi(type: FootballTeam.self, leagId: id)
            
        }
        else if(sportType == "basketball")
        {
            viewModel.getLatestFromApi(type: BasketballEvent.self, leagId: id)
            viewModel.getUpComingFromApi(type: BasketballEvent.self, leagId: id)
            viewModel.getTeamsFromApi(type: BasketballTeam.self, leagId: id)
            
        }
        else if(sportType == "cricket")
        {
            viewModel.getLatestFromApi(type: CricketEvent.self, leagId: id)
            viewModel.getUpComingFromApi(type: CricketEvent.self, leagId: id)
            viewModel.getTeamsFromApi(type: CricketTeam.self, leagId: id)
            
        }
        else{
            
            viewModel.getLatestFromApi(type: TennisEvent.self, leagId: id)
            viewModel.getUpComingFromApi(type: TennisEvent.self, leagId: id)
            // viewModel.getTeamsFromApi(type:.self, leagId: id!)
            
        }
        
        observeViewModel()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        //viewModel.LatestArray = []
    }
    
}
