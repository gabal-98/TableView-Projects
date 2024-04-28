//
//  ViewController.swift
//  TableView Custom Cell
//
//  Created by robusta on 28/04/2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    var fruits = [Fruit]()

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        fruits.append(Fruit(name: "apple", price: "140", description: "test description", image: UIImage(named: "img_apple")!))
        fruits.append(Fruit(name: "banana", price: "190", description: "test description", image: UIImage(named: "img_banana")!))
        fruits.append(Fruit(name: "lemon", price: "200", description: "test description", image: UIImage(named: "img_lemon")!))
        fruits.append(Fruit(name: "mango", price: "130", description: "test description", image: UIImage(named: "img_mango")!))
        fruits.append(Fruit(name: "orange", price: "60", description: "test description", image: UIImage(named: "img_orange")!))
        fruits.append(Fruit(name: "papaya", price: "10", description: "test description", image: UIImage(named: "img_papaya")!))
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell
        let data = fruits[indexPath.row]
        cell?.configureCell(image: data.image, name: data.name, price: data.price, description: data.description)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


struct Fruit {
    
    let name: String
    let price: String
    let description: String
    let image: UIImage
}
