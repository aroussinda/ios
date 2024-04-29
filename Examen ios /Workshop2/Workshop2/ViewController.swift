//
//  ViewController.swift
//  Workshop2
//
//  Created by Sinda Arous on 31/3/2022.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    var round = 0
    var random = 0
    
    
    @IBOutlet weak var mslide: UISlider!
    @IBOutlet weak var randomValueLabel: UILabel!
    @IBOutlet weak var roundValueLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadGame()
    }

    func GenerateRandem() -> Int {
        return Int.random(in: 1..<100)
    }
    func loadGame()  {
        
        score = 0
        round = 1
        random = GenerateRandem()
        randomValueLabel.text = String(random)
        scoreValueLabel.text = String(score)
        roundValueLabel.text = String(round)
        
        
        mslide.value = 50
        mslide.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
        
    }
    func playAction()  {
        let diff = abs(Int(mslide.value.rounded()) - random)
        if diff == 0
        {
            score += 100
            prompAlert(titre: "Good", message: "Bull's eye")
        }else if diff <= 5{
            score += 50
            prompAlert(titre: "Close!", message: "Try again ")
        }else {
            prompAlert(titre: "Faild!", message: "Not even close")
        }
        updateLabels()
    }
    func prompAlert(titre :String ,message: String)  {
        let alert = UIAlertController(title: titre , message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it ?", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    func updateLabels()  {
        
        round += 1
        random = GenerateRandem()
        
        scoreValueLabel.text = String(score)
        roundValueLabel.text = String(round)
        randomValueLabel.text = String(random)
        
        mslide.value = 50
        mslide.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
    }
    @IBAction func hitMeAction(_ sender: Any) {
        playAction()
    }
    @IBAction func resertAction(_ sender: UIButton) {
        loadGame()
    }
}

