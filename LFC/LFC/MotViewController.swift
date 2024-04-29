//
//  MotViewController.swift
//  LFC
//
//  Created by Sinda Arous on 5/4/2022.
//

import UIKit
import CoreData
class MotViewController: UIViewController {

    var player = ""
    @IBOutlet weak var imagePlayer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retreiveData()
        imagePlayer.image = UIImage(named: player)
        // Do any additional setup after loading the view.
    }
    
    func retreiveData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Season")
        
        do {
            
            let data = try managedContext.fetch(request)
            for item in data {
                
                player = item.value(forKey: "name") as! String

            }
            
        } catch  {
            
            print("Fetching error !")
        }
        
    }
    

}
