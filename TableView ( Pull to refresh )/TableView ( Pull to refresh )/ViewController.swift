//
//  ViewController.swift
//  TableView ( Pull to refresh )
//
//  Created by robusta on 29/04/2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    var values = [String]()
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshController.tintColor = .gray
        refreshController.addTarget(self, action: #selector(addValue), for: .valueChanged)
        tableView.addSubview(refreshController)
    }
    
    @objc func addValue() {
        
        values.append("value \(values.count + 1)")
        refreshController.endRefreshing()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = values[indexPath.row]
        return cell
    }

}

