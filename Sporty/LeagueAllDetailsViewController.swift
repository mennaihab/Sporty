//
//  LeagueAllDetailsViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 27/05/2023.
//

import UIKit

class LeagueAllDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    lazy var viewModel: LeagueDetailsViewModel = {
        return LeagueDetailsViewModel()
    }()
    
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.LatestCollectionView {
            return viewModel.numberOfCells
           }
        else if collectionView == self.upComingCollectionView{
            return viewModel.numberOfCells
        }
        else{
            return viewModel.numberOfCells
        }

       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //  if collectionView == self.LatestCollectionView {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueDetailsViewCell
        cell.firstTeamName.text = viewModel.LatestArray[indexPath.row].firstTeam
        cell.secondTeamName.text = viewModel.LatestArray[indexPath.row].secondTeam
        cell.gameTime.text = viewModel.LatestArray[indexPath.row].time
        cell.gameDate.text = viewModel.LatestArray[indexPath.row].date
        cell.finalResult.text = viewModel.LatestArray[indexPath.row].gameResult
       
        print(viewModel.LatestArray[indexPath.row].firstTeam)
                   
                   // Set up cell
                 return cell
               }
    
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.LatestCollectionView {
            let width = collectionView.frame.size.width - 15
            return CGSize(width: width/3, height: 10)
        }
        else{
            let width = collectionView.frame.size.width - 15
            return CGSize(width: width/2, height: 50)
        }
    }
    
    func observeViewModel() {
        
        
        viewModel.updateIndicatorClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let isLoading = self?.viewModel.isLoading {
                    if isLoading {
                    //    self?.networkIndicator.startAnimating()
                        UIView.animate(withDuration: 0.2, animations: {
                          //  self?.tableView.alpha = 0.0
                        })
                    }else {
                      //  self?.networkIndicator.stopAnimating()
                       
                    }
                }
            }
        }
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.LatestCollectionView.reloadData()
            }
        }
        
        
    }
        
    
    

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    @IBOutlet weak var LatestCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsCollectionView.delegate = self
        upComingCollectionView.delegate = self
        LatestCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        upComingCollectionView.dataSource = self
        LatestCollectionView.dataSource = self
        
        
        self.upComingCollectionView!.register(UINib(nibName: "LeagueDetailsViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.LatestCollectionView!.register(UINib(nibName: "LeagueDetailsViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        navigationItem.title = "League Details"
       // viewModel.getLatestFromApi(type: CricketEvent.Type, leagId: 200)
        viewModel.getLatestFromApi(type: FootballEvent.self, leagId: 227)
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

}
