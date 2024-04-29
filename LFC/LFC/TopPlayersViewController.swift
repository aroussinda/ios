//
//  TopPlayersViewController.swift
//  LFC
//
//  Created by Sinda Arous on 5/4/2022.
//

import UIKit
import CoreData
class TopPlayersViewController: UIViewController  , UICollectionViewDataSource, UICollectionViewDelegate{
    var players = [String]()
    var role = [String]()
    var ratings = [Int32]()
    @IBOutlet weak var mCollectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mItem",for: indexPath)
        let cv = cell.contentView
        let label = cv.viewWithTag(2) as! UILabel
        let ImageView = cv.viewWithTag(1) as! UIImageView
        label.text = String(ratings[indexPath.row])
        
        ImageView.image = UIImage(named: players[indexPath.row])
 
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
        let predicate = NSPredicate(format: "rate > %d", 7)
        request.predicate = predicate
        
        do {
           let result = try managedContext.fetch(request)
            for item in result{
              
                players.append(item.value(forKey: "name") as! String)
                role.append(item.value(forKey: "role") as! String)
                ratings.append(item.value(forKey: "rate") as! Int32)
                mCollectionView.reloadData()
                print("################@fetchdata")
            }
        } catch  {
            
        }
    }
    
    func alertMessage(message: String) {
        
        let alert = UIAlertController(title: "Vote", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if MotExist() {
            alertMessage(message: "You have already voted!")
        }else {
            insertItem(name: players[indexPath.row], role: role[indexPath.row])
        }
        
    }
    func MotExist() -> Bool {
        var MotsExist = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Season")
        
       
        do {
           let result =  try managedContext.fetch(request)
            if result.count > 0 {
                MotsExist = true
                
            }
        } catch  {
            print("fetching error")
        }
        return MotsExist
    }
    func insertItem(name: String, role: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Season", in: managedContext)
        let object = NSManagedObject.init(entity: entityDescription!, insertInto: managedContext)
        
        object.setValue(name, forKey:"name" )
       // object.setValue(rating, forKey:"rate" )
        object.setValue(role, forKey: "role")
        
        
        do {
            
            try managedContext.save()
            alertMessage(message: "You voted for " + name + " as MOTS.")
            
        } catch {
            
            alertMessage(message:"MOTS insert error !")
        }

    }
    
    @IBAction func motAction(_ sender: Any) {
        if MotExist() {
        performSegue(withIdentifier: "thirdSegue", sender: sender)
        }else {
            alertMessage(message: "You don t even voted for as MOTS.")
        }
    }
    
    
    
}
