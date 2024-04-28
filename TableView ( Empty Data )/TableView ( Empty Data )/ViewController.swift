//
//  ViewController.swift
//  TableView ( Empty Data )
//
//  Created by robusta on 29/04/2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    var logoView = UIImageView()
    var label = UILabel()
    
    var names = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        updateUI()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, handler in
            self.names.remove(at: indexPath.row)
            self.tableView.reloadData()
            self.updateUI()
            
            handler(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Name", message: "Write the name you want to add", preferredStyle: .alert)
        alert.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak alert] action in
            if let name = alert?.textFields![0].text {
                self.names.append(name)
                self.tableView.reloadData()
                self.updateUI()
            }
        }
        alert.addAction(addAction)
        present(alert, animated: true)
    }
    
    func updateUI() {
        if names.count == 0 {
            
            logoView = UIImageView()
            logoView.frame = CGRect(x: 50, y: 200, width: view.frame.size.width - 100, height: 400)
            logoView.image = UIImage(systemName: "trash.fill")
            logoView.tintColor = .red
            
            label = UILabel()
            label.frame = CGRect(x: 50, y: 700, width: view.frame.size.width - 100, height: 100)
            label.textAlignment = .center
            label.textColor = .red
            label.text = "No Data to Display"
            
            view.addSubview(logoView)
            view.addSubview(label)
            
        }else {
            logoView.removeFromSuperview()
            label.removeFromSuperview()
        }
    }
}

