//
//  ViewController.swift
//  FirstApp
//
//  Created by Sinda Arous on 25/1/2022.
//

import UIKit

class ViewController: UIViewController {
    // var
    var random :Int = 0
    var score :Int = 0
    var round :Int = 1
    //widget
    @IBOutlet weak var randomValueLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var roundValueLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UISlider!
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       //init
        self.InitGame()
    }
    //actions

    @IBAction func hitMeAction(_ sender: UIButton) {
        self.playGame()
    }
  
    @IBAction func onValueChanged(_ sender: UISlider) {
        print( sender.value.rounded())
    }
    @IBAction func resetAction(_ sender: Any) {
        self.InitGame()
    }
    //methodes
    func playGame()  {
      // print( sliderValueLabel.value)
        var value = Int(sliderValueLabel.value.rounded())
        if random==value {
            promptAction(promptTitle: "Unbeleivable!", promptText: "Bull's Eye! You received 100 points.")
            print("Bulls eyes")
            score+=100
        }else if abs(random-value)<5{
            score+=50
            promptAction(promptTitle: "Nice!", promptText: " You received 50 points.")
            print("nice")
        }
        else {
            promptAction(promptTitle: "Not Even Close", promptText: "You received 0 points.")
            print("try again")
        }
        setParam()
    }
    func InitGame()  {
      score=0
      round=1
      sliderValueLabel.value=50
      random = Int.random(in: 1..<99)//arch4random
      //label
        scoreValueLabel.text=String(score)
        randomValueLabel.text=String(random)
        roundValueLabel.text=String(round)
    }
    func setParam() {
       
        round+=1
        random=Int.random(in: 1..<99)
        sliderValueLabel.value=50
        
        scoreValueLabel.text=String(score)
        randomValueLabel.text=String(random)
        roundValueLabel.text=String(round)
        
    }
    func promptAction(promptTitle: String, promptText: String){
        
        let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
   
}

