//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Yeontae Kim on 4/28/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    var history: [RPSMatch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell")!
        let match = self.history[(indexPath as NSIndexPath).row]
        
        // Set the match result, winner and loser
        cell.textLabel?.text = getMatchResult(p1: match.p1, p2: match.p2)
        // cell.detailTextLabel?.text
        
        return cell
    }
    
    func getMatchResult(p1: RPS, p2: RPS) -> String {
        
        switch (p1, p2) {
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
            return "Win"
        case (.paper, .paper), (.scissors, .scissors), (.rock, .rock):
            return "Tie"
        default:
            return "Lose"
        }
    }

    @IBAction func goBackToGame(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
