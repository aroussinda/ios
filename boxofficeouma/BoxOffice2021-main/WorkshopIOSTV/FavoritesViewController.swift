//
//  FavoritesViewController.swift
//  WorkshopIOSTV
//
//  Created by Khaled Guedria on 10/25/20.
//  Copyright © 2020 Khaled Guedria. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var
    var favorites = [String]()
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favCell = tableView.dequeueReusableCell(withIdentifier: "favCell")
        let contentView = favCell?.contentView
        
        let label = contentView?.viewWithTag(1) as! UILabel
        let imageView = contentView?.viewWithTag(2) as! UIImageView
        
        label.text = favorites[indexPath.row]
        imageView.image = UIImage(named: favorites[indexPath.row])
        

        return favCell!
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            //TO DO : Delete from Core Data
            
            
            
            //TO DO : UIAlertController [Movie Deleted Successfully]

            
            
        }
    }

    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do {
            let data = try managedContext.fetch(request)
            for item in data{
                favorites.append(item.value(forKey: "moviename") as! String)
            }

        } catch  {
            print("select error")
        }
    }
    

    func getByCreateria(movieName: String) -> NSManagedObject{
        
        
        //TO DO : Fetch by criteria action
     
     
    }
    
    
    func deleteElement(tableView: UITableView, index: Int) {
        
        //TO DO : Delete From Core Data action
                        
    }

}
