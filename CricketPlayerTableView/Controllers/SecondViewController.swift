//
//  SecondViewController.swift
//  CricketPlayerTableView
//
//  Created by Rojirani Patel on 07/02/2021.
//

import UIKit

protocol DataTransferDelegate {
    
    func playerUpdated(player: CricketPlayer)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var topTitleLevel: UILabel!
    
    @IBOutlet weak var renamePlayerButton: UIButton!
    
    var myTeam: CricketTeam?
    var selectedPlayer: CricketPlayer?
    
    var delegate: DataTransferDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topTitleLevel.text = selectedPlayer?.name ?? "Nobody selected"
    }
    
    @IBAction func renamePlayerButtonTapped(_ sender: UIButton) {
        
        if var player = selectedPlayer, let class02 = myTeam{
            if let index = class02.getPlayers().firstIndex { one in
                
                one.name == player.name
            }
            {
                player.name = "Tendulkar"
                class02.team[index] = player
                delegate?.playerUpdated(player: player)
                print("player name changed to Tendulkar")
                
            }
        }
        dismiss(animated: true, completion: nil)
    }
    

}
