//
//  LeagueViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 23/05/2023.
//

import UIKit

class LeagueViewController: UITableViewController {
    
    var filteredData : [String]!
    @IBOutlet weak var searchbar: UISearchBar!
    lazy var viewModel: LeagueViewModel = {
        return LeagueViewModel()
    }()
    
    var networkIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorColor = UIColor.clear
        
        searchbar.delegate = self
        
       // print("menna")
//        if let leagueNames = viewModel.leaguesNames {
//            for item in viewModel.leaguesNames!{
//                filterdData.append(item)
//            }
//        }
//
//        else{
//            filterdData = [""]
//        }
//
        
        
        
        
        networkIndicator.color = UIColor.blue
        networkIndicator.center = view.center
        view.addSubview(networkIndicator)
        
        
        self.navigationItem.title = "Leagues"
        viewModel.getLeaguesFromApi(type: CricketLeagues.self)

        observeViewModel()
        
        
    }
    
    func observeViewModel() {
        
        
        viewModel.updateIndicatorClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let isLoading = self?.viewModel.isLoading {
                    if isLoading {
                        self?.networkIndicator.startAnimating()
                        UIView.animate(withDuration: 0.2, animations: {
                          //  self?.tableView.alpha = 0.0
                        })
                    }else {
                        self?.networkIndicator.stopAnimating()
                       
                    }
                }
            }
        }
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfCells
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueTableViewCell
        cell.leagueName.text = viewModel.filteredArray[indexPath.row].name
        cell.leagueImage.image = UIImage(named: "basketball.png")
        print(indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.orange
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.clipsToBounds = true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 108
    }
}
    
    extension LeagueViewController:UISearchBarDelegate{
    
         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             viewModel.getResultSearch(searchedText:searchText)
         
//             self.filteredData = searchText.isEmpty ? viewModel.leaguesArray : viewModel.leaguesArray.filter{
//                 $0.name!.range(of: searchText, options: .caseInsensitive) != nil
//             }
//
//            // ({(dataString.: String) -> Bool in
//              //  return dataString.range(of: searchText, options: .caseInsensitive) != nil
//         //   })
//
//
//            tableView.reloadData()
            
        }
      
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
                self.searchbar.showsCancelButton = true
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchbar.showsCancelButton = false
            searchbar.text = ""
            searchbar.resignFirstResponder()
        }
    
    


}
