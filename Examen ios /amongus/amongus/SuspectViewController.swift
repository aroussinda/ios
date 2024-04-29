//
//  SuspectViewController.swift
//  amongus
//
//  Created by Sinda Arous on 4/4/2022.
//

import UIKit
import CoreData
class SuspectViewController: UIViewController ,UICollectionViewDataSource{
    
    
    
    var suspects = [String]()
    var colors = [String]()
    
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suspects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mItem",for: indexPath)
        let cv = cell.contentView
        let label = cv.viewWithTag(2) as! UILabel
        let ImageView = cv.viewWithTag(1) as! UIImageView
        label.text = suspects[indexPath.row]
        
        ImageView.image = UIImage(named: colors[indexPath.row])
 
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        mCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData()  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Player")
        
        
        do {
           let result = try managedContext.fetch(request)
            for item in result{
                suspects.append(item.value(forKey: "name") as! String)
                colors.append(item.value(forKey: "color") as! String)
                mCollectionView.reloadData()
            }
        } catch  {
            
        }
    }
   

}
