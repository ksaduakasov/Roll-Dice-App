//
//  ResultsTableViewCell.swift
//  RollDiceApp
//
//  Created by Kalbek Saduakassov on 16.04.2021.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    
    public var roll: (first: Int, second: Int)? {
        didSet {
            if let roll = roll {
                firstLabel.text = "first: \(roll.first + 1)"
                secondLabel.text = "second: \(roll.second + 1)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    
}
