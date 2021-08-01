//
//  ResultsViewController.swift
//  RollDiceApp
//
//  Created by Kalbek Saduakassov on 16.04.2021.
//

import UIKit

protocol ResultsViewControllerProtocol {
    func functionName(_ first: Int, _ second: Int)
}

class ResultsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    public var delegate: ResultsViewControllerProtocol?
    public var rolls = [(first: Int, second: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib =  UINib(nibName: "ResultsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ResultsTableViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.roll = rolls[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.functionName(rolls[indexPath.row].first, rolls[indexPath.row].second)
        dismiss(animated: true, completion: nil)
    }
    
    
}
