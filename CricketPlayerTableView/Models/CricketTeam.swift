//
//  CricketTeam.swift
//  CricketPlayerTableView
//
//  Created by Rojirani Patel on 07/02/2021.
//

import Foundation

class CricketTeam{
    
    var teamName: String?
    var teamSize: Int = 0
    
    var team: [CricketPlayer] = [CricketPlayer](){
        didSet{
            teamSize = team.count
        }
    }
    //Getting players from the private array
    func getPlayers()-> [CricketPlayer]{
        return team
    }
    
    //Adding a player to the team
    func addPlayerToTeam(player: CricketPlayer){
        
        print("Adding an Player")
        team.append(player)
    }
    
    //Count how many in a team
    func howManyInTeam() -> Int {
        
        return team.count
    }
    
    //Removing a player from the team
    func removePlayerFromTeam(name: String){
        
        let removePlayer = team.removeFirst()
        print("Removing a Player: \(removePlayer)")
        
    }
    
}
