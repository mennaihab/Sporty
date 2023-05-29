//
//  LeagueDetailsViewController.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import UIKit




class LeagueDetailsViewController: UICollectionViewController {


 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UINib(nibName: "LeagueDetailsViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        navigationItem.title = "League Details"
        let layout = UICollectionViewCompositionalLayout{
            sectionIndex,environment in
            // return self.LatesteventsSection()
            switch(sectionIndex){
                case 0: return self.LatesteventsSection()
            default:return self.NowPlayingSection()
           // default: return self.LatesteventsSection()
                // default:
                //  return self.TeamSection()
            }
        }
            
            collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)

          
            
        }
        
    
    
    
    
    
    
//    self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "LeageDetailscell")
    
        //collectionView.register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)

   

    func LatesteventsSection()->NSCollectionLayoutSection{
        var itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing:5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 5, trailing:5)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        

        
        return section
        
    }
    
    func NowPlayingSection()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
       
        
        let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        collectionView.alwaysBounceVertical = false
        
        return section
        
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
    
       // switch(indexPath.section){
//             case 0:
//                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!LeagueDetailsViewCell
//            return cell
//        case 1:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!LeagueDetailsViewCell
//                 return cell
            
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!LeagueDetailsViewCell
    
          return cell
          //   }
        // Configure the cell
    
      
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as!HeaderCollectionReusableView
        //header.configure()
        header.categoryLabel.text = "Latest Result"
       // header.backgroundColor = .blue
        
        print("kk")
        return header
    }
    

   
    
    
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        <#code#>
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//         return CGSize(width: (self.view.frame.size.width - 60) / 2, height: (self.view.frame.size.width - 60) / 2)
//
//     }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
