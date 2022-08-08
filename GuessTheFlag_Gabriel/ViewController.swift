//
//  ViewController.swift
//  GuessTheFlag_Gabriel
//
//  Created by user219712 on 8/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var points = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["us", "uk", "spain", "russia", "poland", "nigeria", "monaco", "italy", "ireland", "germany", "france"]
        
        makeQuestion()
    }

    func makeQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        var labelTitle: String
        
        if sender.tag == correctAnswer {
            labelTitle = "Acertou"
            points += 1
        } else {
            labelTitle = "Errou"
            points -= 1
        }
        
        let alert = UIAlertController(title: labelTitle, message: "Sua pontuação é \(points)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: makeQuestion))
        
        present(alert, animated: true)
    }

}

