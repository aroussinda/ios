//
//  FichPariViewController.swift
//  examen4sim3
//
//  Created by Sinda Arous on 6/4/2022.
//

import UIKit
import CoreData
class FichPariViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    
  
    
    
    
   
    
  
    @IBOutlet weak var oddLabel: UILabel!
    
    @IBOutlet weak var bonusLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    var Home = [String]()
    var Away = [String]()
    var Cote = [Int32]()
    var CoteTotale:Int32 = 0
    var totalGain: Int32 = 0
    var bonus :Int32 = 0
    var amout : Int32 = 0
    @IBOutlet weak var countLabel: UILabel!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Home.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mItem",for: indexPath)
               let cv = cell.contentView
               let labelHome = cv.viewWithTag(1) as! UILabel
        let labelAway = cv.viewWithTag(2) as! UILabel
        let labelCote = cv.viewWithTag(3) as! UILabel
        labelHome.text = String(Home[indexPath.row])
        labelAway.text = String(Away[indexPath.row])
        labelCote.text = String(Cote[indexPath.row])
        
               return cell
    }
    
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
        mCollectionView.reloadData()
        countLabel.text = String(Home.count ) + "Games"
       
        // Do any additional setup after loading the view.
    }
    func fetchData()  {
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          let persistenceContainer = appDelegate.persistentContainer
          let managedContext = persistenceContainer.viewContext
          
          let request = NSFetchRequest<NSManagedObject>(entityName: "Pari")
        
          
          do {
             let result = try managedContext.fetch(request)
              for item in result{
                
                  Home.append(item.value(forKey: "nameHome") as! String)
                  Away.append(item.value(forKey: "nameAway") as! String)
                  Cote.append(item.value(forKey: "cote") as! Int32)
                  mCollectionView.reloadData()
                CoteTotale +=  item.value(forKey: "cote") as! Int32
               // bonus = (CoteTotale) * 0.15
                bonusLabel.text = String(Double(CoteTotale) * 0.15)
                totalLabel.text = String(CoteTotale)
               // totalLabel.text = (CoteTotale + (Double(CoteTotale) * 0.15) * amout)
                print("################@fetchdata")
              }
          } catch  {
              
          }
      }

    @IBAction func deleteAll(_ sender: Any) {
        deleteElements()
        Home.removeAll()
        mCollectionView.reloadData()
    }
    
    func getByCreateria(name: String) -> NSManagedObject{
           
           var exExist:NSManagedObject?
           
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let persistentContainer = appDelegate.persistentContainer
           let managedContext = persistentContainer.viewContext
           
           let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Pari")
         
           
           do {
               let result = try managedContext.fetch(request)
               if result.count > 0 {
                   
                   exExist = (result[0] as! NSManagedObject)
                   print("pari   exists !")
                   
               }
               
           } catch {
               
               print("Fetching by criteria error !")
           }
           
           
           return exExist!
       }
       func deleteElements() {
           
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let persistentContainer = appDelegate.persistentContainer
           let managedContext = persistentContainer.viewContext
           
           for item in Home {
               
               let object = getByCreateria(name: item)
               managedContext.delete(object)
           }
           

           
                   
       }
       
    @IBAction func amout1(_ sender: Any) {
        amout = 1
    }
    
    @IBAction func amout5(_ sender: Any) {
        amout = 5
    }
    
    @IBAction func amout10(_ sender: Any) {
        amout = 10
    }
    
}
