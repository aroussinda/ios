//
//  DetailsViewController.swift
//  Boxoffice2
//
//  Created by Apple Esprit on 28/10/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //Var
    var movieTitle : String?

    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.image = UIImage(named: movieTitle!)
        movieLabel.text = movieTitle

        // Do any additional setup after loading the view.
    }
    
}
