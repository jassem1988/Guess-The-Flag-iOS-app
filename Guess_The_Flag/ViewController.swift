//
//  ViewController.swift
//  Guess_The_Flag
//
//  Created by Jassem Al-Buloushi on 4/6/19.
//  Copyright © 2019 Jassem Al-Buloushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Guess The Flag"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(scoreTapped))

        countries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        numberOfQuestion += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        if numberOfQuestion <= 10 {
            let ac = UIAlertController(title: title, message: "The right answer is \(countries[correctAnswer]) \n Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue to question \(numberOfQuestion)", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
        
    }
    
    @objc func scoreTapped() {
        
        let alertController = UIAlertController(title: "Score", message: "Your score is: \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alertController, animated: true)
        //        let vc = UIActivityViewController(activityItems: [score], applicationActivities: [])
        //        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        //        present(vc, animated: true)
        
        
        }
        

    }
    



