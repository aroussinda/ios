//
//  HomeViewController.swift
//  amongus
//
//  Created by Sinda Arous on 4/4/2022.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   

   
    var avatarName:String?
   var players = ["Hu5tl3r", "MC_Killer", "CR7", "Not_Impostor", "BabyShark", "AKINFENWA", "DR'Who"]
    var colors = ["Red","Yellow","Brown","Light-blue","Orange","Rose","Purple"]
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello" + avatarName!
        // Do any additional setup after loading the view.
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        let image = contentView?.viewWithTag(1) as! UIImageView
        let label1 = contentView?.viewWithTag(2) as! UILabel
        let label2 = contentView?.viewWithTag(3) as! UILabel
        label1.text = players[indexPath.row]
        label2.text = colors[indexPath.row]
        image.image = UIImage(named: colors[indexPath.row])
 
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let player = players[indexPath.row]
        performSegue(withIdentifier: "secondSegue", sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "secondSegue"{
            let indexPath = sender as! IndexPath
        let destination = segue.destination as!DetailsViewController
            destination.playerName = players[indexPath.row]
            destination.color = colors[indexPath.row]
            
        }
       
        
    }
    @IBAction func emergencyMeeting(_ sender: Any) {
        performSegue(withIdentifier: "thirdSegue", sender: sender)
    }
    
}
