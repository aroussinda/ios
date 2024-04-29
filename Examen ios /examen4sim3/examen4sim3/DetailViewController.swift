//
//  DetailViewController.swift
//  examen4sim3
//
//  Created by Sinda Arous on 6/4/2022.
//

import UIKit
import CoreData
class DetailViewController: UIViewController {

    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var awayImage: UIImageView!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var timeMatch: UILabel!
    @IBOutlet weak var randomHome: UILabel!
    @IBOutlet weak var randomDraw: UILabel!
    @IBOutlet weak var randomAway: UILabel!
    @IBOutlet weak var randomGG: UILabel!
    @IBOutlet weak var randomNG: UILabel!
    var nameHome:String = ""
    var nameAway:String = ""
    var time : String = ""
    
    var random:Int32 = 0
    var rh:Int32 = 0
    var ra:Int32 = 0
    var rd:Int32 = 0
    var gg:Int32 = 0
    var ng:Int32 = 0
    func GenerateRandem() -> Int32 {
        return Int32.random(in: 1..<5)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        homeName.text = nameHome
        homeImage.image = UIImage(named: nameHome)

        awayName.text = nameAway
        awayImage.image = UIImage(named: nameAway)

        timeMatch.text = time
        
        
        random = GenerateRandem()
        randomHome.text = String(random)
        randomDraw.text = String(random)
        
        randomAway.text = String(random)
        randomGG.text = String(random)
        randomNG.text = String(random)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func alert(title:String , message:String )  {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            
        }
   
    func checkPari() -> Bool {
           var pariExist = false
           
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let persistenceContainer = appDelegate.persistentContainer
           let managedContext = persistenceContainer.viewContext
           
           let request = NSFetchRequest<NSManagedObject>(entityName: "Pari")
           let predicate = NSPredicate(format: "nameHome = %@", nameHome)
           
           request.predicate = predicate
           do {
              let result =  try managedContext.fetch(request)
               if result.count > 0 {
                pariExist = true
                   
               }
           } catch  {
               print("fetching error")
           }
           return pariExist
       }

    @IBAction func homeAction(_ sender: Any) {
        
        if !checkPari() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistenceContainer = appDelegate.persistentContainer
            let managedContext = persistenceContainer.viewContext
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "Pari", in: managedContext)
            let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
            
            object.setValue(nameHome, forKey:"nameHome" )
            object.setValue(nameAway, forKey:"nameAway" )
            object.setValue(time, forKey: "time")
            object.setValue(Int32(randomHome.text!), forKey: "cote")
            
           // print(String(rating))
            
            
            do {
                try   managedContext.save()
                self.alert(title: "Sucess", message: "Pari is added ! ")
                print("Insert Done ")
            } catch  {
                print("Insert Error ")
            }
              }else {
                  self.alert(title: "Warning", message: "Pari is already added ! ")
              }

    }
    @IBAction func drawAction(_ sender: Any) {
        if !checkPari() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistenceContainer = appDelegate.persistentContainer
            let managedContext = persistenceContainer.viewContext
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "Pari", in: managedContext)
            let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
            
            object.setValue(nameHome, forKey:"nameHome" )
            object.setValue(nameAway, forKey:"nameAway" )
            object.setValue(time, forKey: "time")
            object.setValue(Int32(randomDraw.text!), forKey: "cote")
            
           // print(String(rating))
            
            
            do {
                try   managedContext.save()
                self.alert(title: "Sucess", message: "Pari is added ! ")
                print("Insert Done ")
            } catch  {
                print("Insert Error ")
            }
              }else {
                  self.alert(title: "Warning", message: "Pari is already added ! ")
              }
    }
    @IBAction func awayAction(_ sender: Any) {
        if !checkPari() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistenceContainer = appDelegate.persistentContainer
            let managedContext = persistenceContainer.viewContext
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "Pari", in: managedContext)
            let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
            
            object.setValue(nameHome, forKey:"nameHome" )
            object.setValue(nameAway, forKey:"nameAway" )
            object.setValue(time, forKey: "time")
            object.setValue(Int32(randomAway.text!), forKey: "cote")
            
           // print(String(rating))
            
            
            do {
                try   managedContext.save()
                self.alert(title: "Sucess", message: "Pari is added ! ")
                print("Insert Done ")
            } catch  {
                print("Insert Error ")
            }
              }else {
                  self.alert(title: "Warning", message: "Pari is already added ! ")
              }
    }
    
    @IBAction func ggAction(_ sender: Any) {
        if !checkPari() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistenceContainer = appDelegate.persistentContainer
            let managedContext = persistenceContainer.viewContext
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "Pari", in: managedContext)
            let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
            
            object.setValue(nameHome, forKey:"nameHome" )
            object.setValue(nameAway, forKey:"nameAway" )
            object.setValue(time, forKey: "time")
            object.setValue(Int32(randomGG.text!), forKey: "cote")
            
           // print(String(rating))
            
            
            do {
                try   managedContext.save()
                self.alert(title: "Sucess", message: "Pari is added ! ")
                print("Insert Done ")
            } catch  {
                print("Insert Error ")
            }
              }else {
                  self.alert(title: "Warning", message: "Pari is already added ! ")
              }
    }
    
    @IBAction func ngAction(_ sender: Any) {
        if !checkPari() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistenceContainer = appDelegate.persistentContainer
            let managedContext = persistenceContainer.viewContext
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "Pari", in: managedContext)
            let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
            
            object.setValue(nameHome, forKey:"nameHome" )
            object.setValue(nameAway, forKey:"nameAway" )
            object.setValue(time, forKey: "time")
            object.setValue(Int32(randomNG.text!), forKey: "cote")
            
           // print(String(rating))
            
            
            do {
                try   managedContext.save()
                self.alert(title: "Sucess", message: "Pari is added ! ")
                print("Insert Done ")
            } catch  {
                print("Insert Error ")
            }
              }else {
                  self.alert(title: "Warning", message: "Pari is already added ! ")
              }
    }
}
