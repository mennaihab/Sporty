//
//  FavouritesTableViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 22/05/2023.
//

import UIKit
import CoreData
import Reachability

class FavouritesTableViewController: UITableViewController {
    
    var context : NSManagedObjectContext?
    
    
    lazy var viewModel: FavouriteaviewModel = {
        return FavouriteaviewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Favourites"
        
        tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorColor = UIColor.clear
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        observeViewModel()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchFavourites(context:context!)
    }
    
    
    func observeViewModel(){
        viewModel.updateTableClosure = { [weak self] () in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! LeagueTableViewCell
        
        cell.leagueName.text = viewModel.favouriteArray[indexPath.row].name
        cell.leagueImage.sd_setImage(with: URL(string: viewModel.favouriteArray[indexPath.row].logo ?? "" ), placeholderImage: UIImage(named: "football.png"))
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.systemOrange
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.clipsToBounds = true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 108
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var reachability =  try? Reachability()
        
        if(reachability!.connection != .wifi)
        {
            
            
            let alert = UIAlertController(title: "Alert", message: "Check your Internet Connection", preferredStyle: UIAlertController.Style.alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                self.dismiss(animated: true)
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "teamDetails") as! TeamDetailsViewController
            
            vc.id = viewModel.favouriteArray[indexPath.row].id!
            vc.name = viewModel.favouriteArray[indexPath.row].name!
            vc.logo = viewModel.favouriteArray[indexPath.row].logo!
            print(viewModel.favouriteArray[indexPath.row].type!)
            print(viewModel.favouriteArray[indexPath.row].id!)
            vc.sportType = viewModel.favouriteArray[indexPath.row].type!
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete from favourites?", preferredStyle: UIAlertController.Style.alert)
            
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                
                print("Deleted")
                let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"TeamData")
                
                if let result = try? self.context!.fetch(fetchReq) {
                    
                    var object:NSManagedObject = result[indexPath.row]
                    self.context!.delete(object)
                }
                
                do {
                    try self.context!.save()
                } catch {
                    print("error on saving")
                }
                self.viewModel.fetchFavourites(context: self.context!)
                self.dismiss(animated: true)
                
                
                
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                
                self.dismiss(animated: true)
                
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        
    }
    
}
