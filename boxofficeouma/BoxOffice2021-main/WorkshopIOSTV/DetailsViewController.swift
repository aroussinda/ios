//
//  DetailsViewController.swift
//  WorkshopIOSTV
//
//  Created by Khaled Guedria on 10/18/20.
//  Copyright © 2020 Khaled Guedria. All rights reserved.
//

import UIKit
import CoreData


class DetailsViewController: UIViewController {
    
    //var
    var movieName:String?
    
    
    
    
    //Widgets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    
    
    
    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //OnStart
        movieImageView.image = UIImage(named: movieName!)
        movieNameLabel.text = movieName!

}
    
    
    
    //IBActions
    @IBAction func saveToFavsAction(_ sender: Any) {
        if !checkMovie(movie:movieName!)
        {
        insertMovie()
        }
        prompt(title: "Movie", message: "already exist")
    }
    
    

    
    //FUNCTIONS
    func insertMovie() {
        
        //TO DO : Insert movie entity in core data [local storage]
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let mangedContext = persistentContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Movie", in: mangedContext)
        let obj = NSManagedObject(entity: entityDescription!, insertInto: mangedContext)
        obj.setValue(movieName, forKey: "moviename")
        
        do {
            try mangedContext.save()
            prompt(title: "success", message: "succefuly added")
            
        } catch {
            print("insert error")
        }
    }
    
    //GET BY NAME
    func getByCreateria(movie:String) -> Bool{
        
        var isExist = false ;
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let mangedContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
       let predicate = NSPredicate(format:"moviename = %@" , movie )
        request.predicate=predicate
        do {
          let result =  try mangedContext.fetch(request)
            if result.count > 0
            {isExist = true}
        } catch  {
          print("error")
        }
        
        
        
        
        
        
        return isExist;
        
    }
    
    
    func prompt(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
   
    
    
    
    


}
