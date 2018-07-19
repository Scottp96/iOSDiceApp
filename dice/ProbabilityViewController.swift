//
//  ProbabilityViewController.swift
//  dice
//
//  Created by Scott Pastor on 12/3/17.
//  Copyright © 2017 Scott Pastor. All rights reserved.
//

import UIKit

class ProbabilityViewController: UIViewController, UITableViewDataSource {
        
    @IBOutlet weak var rollsTableView: UITableView!
    var fetchedRolls = [Rolls]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollsTableView.dataSource = self
        parseData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedRolls.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rollsTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = fetchedRolls[indexPath.row].total
        cell?.detailTextLabel?.text = fetchedRolls[indexPath.row].probability
        return cell!
    }
    
    func parseData() {
        fetchedRolls = []
        
        let url = "https://api.myjson.com/bins/10nndv"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "Get"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error")
            } else {
                do {
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    for eachFetchedRolls in fetchedData {
                        let eachRolls = eachFetchedRolls as! [String: Any]
                        let total = eachRolls["total"] as! String
                        let probability = eachRolls["probability"] as! String
                        self.fetchedRolls.append(Rolls(total: total, probability: probability))
                    }
                    //print(self.fetchedRolls)
                    self.rollsTableView.reloadData()
                }
                catch {
                    print("Error2")
                }
            }
        }
        task.resume()
    }
}

class Rolls {
    var total: String
    var probability: String
    
    init(total: String, probability: String){
        self.total = total
        self.probability = probability
    }
}
