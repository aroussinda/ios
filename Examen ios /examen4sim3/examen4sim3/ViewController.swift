//
//  ViewController.swift
//  examen4sim3
//
//  Created by Sinda Arous on 6/4/2022.
//

import UIKit

class ViewController: UIViewController  , UITableViewDataSource,UITableViewDelegate{
  

    
    var homeTeams = ["Everton","Arsenal","Southampton","Watford","Aston Villa"]
    var awayTeams = ["Manchester Utd","Brighton","Chelsea","Leeds Utd","Tottenham"]
    var heures = ["12:30","15:00","15:00","15:00","17:30"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
               let contentView = cell?.contentView
        let ImageViewHome = contentView?.viewWithTag(1) as! UIImageView
               
               let ImageViewAway = contentView?.viewWithTag(2) as! UIImageView
        let labelHome = contentView?.viewWithTag(3) as! UILabel
        let labelAway = contentView?.viewWithTag(4) as! UILabel
        let labeltime = contentView?.viewWithTag(5) as! UILabel
        labelHome.text = homeTeams[indexPath.row]
        labelAway.text = awayTeams[indexPath.row]
        labeltime.text = heures[indexPath.row]
        ImageViewHome.image = UIImage(named: homeTeams[indexPath.row])
        ImageViewAway.image = UIImage(named: awayTeams[indexPath.row])
        
               return cell!

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           performSegue(withIdentifier: "firstSegue", sender: indexPath)
           
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "firstSegue"{
               let indexPath = sender as! IndexPath
           let destination = segue.destination as!DetailViewController
               destination.nameHome = homeTeams[indexPath.row]
               destination.nameAway = awayTeams[indexPath.row]
            destination.time = heures[indexPath.row]

           }
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func FichePari(_ sender: Any) {
        
                performSegue(withIdentifier: "secondSegue", sender: sender)
                
            
    }
    
}

