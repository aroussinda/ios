//
//  DetailsViewController.swift
//  LFC
//
//  Created by Sinda Arous on 5/4/2022.
//

import UIKit
import CoreData
class DetailsViewController: UIViewController {

    var playerName:String?
    var rating = 5
    var role:String?
    
    
    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet weak var nomPlayer: UILabel!
    @IBOutlet weak var valueSlider: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomPlayer.text = playerName
        imagePlayer.image = UIImage(named: playerName!)
        print("###########" + role!)
        // Do any additional setup after loading the view.
    }
    func alert(title:String , message:String )  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
        
    }
    func insertItem()  {
        //3 etape n'import quelle crud
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        
        object.setValue(playerName, forKey:"name" )
        object.setValue(rating, forKey:"rate" )
        object.setValue(role, forKey: "role")
        
        print(String(rating))
        
        
        do {
            try   managedContext.save()
            self.alert(title: "Sucess", message: "among is suspected ! ")
            print("Insert Done ")
        } catch  {
            print("Insert Error ")
        }
      
    }
    func checkPlayer() -> Bool {
        var playerExist = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Player")
        let predicate = NSPredicate(format: "name = %@", playerName!)
        
        request.predicate = predicate
        do {
           let result =  try managedContext.fetch(request)
            if result.count > 0 {
                playerExist = true
                
            }
        } catch  {
            print("fetching error")
        }
        return playerExist
    }
    @IBAction func insertPlayer(_ sender: Any) {
        
        if !checkPlayer() {
            insertItem()
        }else {
            self.alert(title: "Warning", message: "player is already added ! ")
        }
    }
   
    @IBAction func sliderValue(_ sender: UISlider) {
        rating = Int(sender.value)
        valueSlider.text = String(Int(sender.value))
    }
    
}
