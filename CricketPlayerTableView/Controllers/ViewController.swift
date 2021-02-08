//
//  ViewController.swift
//  CricketPlayerTableView
//
//  Created by Rojirani Patel on 07/02/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, DataTransferDelegate {
    
    @IBOutlet weak var topTitleLevel: UILabel!
    
    @IBOutlet weak var coutPlayersButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    let myTeam = CricketTeam()
    
    var selectedPlayer: CricketPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTeam.addPlayerToTeam(player: CricketPlayer(name: "Dhoni", email: "Dhoni@gmail.com"))
        myTeam.addPlayerToTeam(player: CricketPlayer(name: "Rohit", email: "Rohit@gmail.com"))
        myTeam.addPlayerToTeam(player: CricketPlayer(name: "Virat", email: "Virat@gmail.com"))
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //MARK:- Action Methods
    
    @IBAction func addPlayerButtonTapped(_ sender: UIButton) {
        
        myTeam.addPlayerToTeam(player: CricketPlayer(name: "Rahul", email: "Rahul@.com"))
        let indexPath = IndexPath(row: myTeam.getPlayers().count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
    }
    @IBAction func countPlayersButtonTapped(_ sender: UIButton) {
        
        topTitleLevel.text = "Number of Players in team: \(myTeam.howManyInTeam())"
    }
    
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        
//        myTeam.team.removeFirst()
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.deleteRows(at: [indexPath], with: .middle)
        
//        myTeam.removePlayerFromTeam(name: "Virat") { (name, index) in
//            self.tableView.deleteRows(at: [IndexPath(row: index, section: 0), with: .middle)
//        }
        myTeam.removePlayerFromTeam(name: "Virat")
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.deleteRows(at: [indexPath], with: .middle)
            
        }
        
    //MARK:- Table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        myTeam.howManyInTeam()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myTeam.getPlayers()[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPlayer = myTeam.getPlayers()[indexPath.row]
        performSegue(withIdentifier: "show second", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Prepare for segue method
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "show second"{
            if let destination = segue.destination as? SecondViewController{
                destination.myTeam = myTeam
                destination.selectedPlayer = selectedPlayer
                destination.delegate = self
            }
        }
    }
    
    //MARK:- Protocol method implemented
    
    func playerUpdated(player: CricketPlayer) {
        
        self.tableView.reloadData()
    }

}

