//
//  DetailsViewController.swift
//  amongus
//
//  Created by Sinda Arous on 4/4/2022.
//

import UIKit
import CoreData
class DetailsViewController: UIViewController {

    var playerName:String?
   // var role:String?
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var nameAvatar: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameAvatar.text = playerName
        imageAvatar.image = UIImage(named: playerName!)
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
       /* let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        
        object.setValue(playerName, forKey:"name" )
        object.setValue(color, forKey:"color" )
        
        
        do {
            try   managedContext.save()
            self.alert(title: "Sucess", message: "among is suspected ! ")
            print("Insert Done ")
        } catch  {
            print("Insert Error ")
        }*/
      
    }
    func checkAmong() -> Bool {
        var AmongExist = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Player")
        let predicate = NSPredicate(format: "name = %@", playerName!)
        
        request.predicate = predicate
        do {
           let result =  try managedContext.fetch(request)
            if result.count > 0 {
                AmongExist = true
                
            }
        } catch  {
            print("fetching error")
        }
        return AmongExist
    }

    @IBAction func suspectAction(_ sender: Any) {
        if checkAmong(){
            self.alert(title: "Warning", message: "among is already suspected ! ")
          
        }else {
            insertItem()
        }
    }
    

}
