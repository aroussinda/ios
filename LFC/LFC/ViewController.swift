//
//  ViewController.swift
//  LFC
//
//  Created by Sinda Arous on 5/4/2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
   
    var players = ["Alisson Becker", "Andy Robertson", "Fabinho Tavares", "Gini Wijnaldum","James Milner", "Joe Gomez", "Jordan Henderson", "Mohamed Salah", "Roberto Firmino", "Sadio Mane", "Trent Alexander Arnold", "Virgil Van Dijk", "Adrian"]
    var role = ["GK", "LB", "CDM", "CM","CM", "CB", "CDM", "RW", "CF", "LW", "RB", "CB", "GK"]
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        let image = contentView?.viewWithTag(1) as! UIImageView
        let label1 = contentView?.viewWithTag(2) as! UILabel
        let label2 = contentView?.viewWithTag(3) as! UILabel
        label1.text = players[indexPath.row]
        label2.text = role[indexPath.row]
        image.image = UIImage(named: players[indexPath.row])
 
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let movie = data[indexPath.row]
        performSegue(withIdentifier: "firstSegue", sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue"{
            let indexPath = sender as! IndexPath
        let destination = segue.destination as!DetailsViewController
            destination.playerName = players[indexPath.row]
            destination.role = role[indexPath.row]
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func topPlayers(_ sender: Any) {
        performSegue(withIdentifier: "secondSegue", sender: sender)
    }
    
    
        


}

