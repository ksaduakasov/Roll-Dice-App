//
//  ViewController.swift
//  RollDiceApp
//
//  Created by Kalbek Saduakassov on 16.04.2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    private var dices = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    private var rolls = [(first: Int, second: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    //MARK: -shake effect
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            shuffle()
        }
    }
    
    private func shuffle() {
        let randomNumber1 = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        rolls.append((first: randomNumber1, second: randomNumber2))
        dice1.image = UIImage(named: dices[randomNumber1])
        dice2.image = UIImage(named: dices[randomNumber2])
    }
    
    
//MARK: -Roll Button
    @IBAction func rollButtonPressed(_ sender: Any) {
        shuffle()
    }
    

//MARK: -Button that shows results
    @IBAction func goToResults(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "resVC") as! ResultsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.rolls = self.rolls
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

extension HomeViewController: ResultsViewControllerProtocol {
    func functionName(_ first: Int, _ second: Int) {
        self.dice1.image = UIImage(named: dices[first])
        self.dice2.image = UIImage(named: dices[second])
    }
    
    
}

