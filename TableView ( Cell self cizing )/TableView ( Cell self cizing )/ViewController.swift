//
//  ViewController.swift
//  TableView ( Cell self cizing )
//
//  Created by robusta on 29/04/2024.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    var cityImages = [UIImage(named: "img_amman") , UIImage(named: "img_cairo") , UIImage(named: "img_dubai") , UIImage(named: "img_riyadh")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityTableViewCell
        cell.cityImage.image = cityImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = cityImages[indexPath.row]
        let photoAspectRatio = photo!.size.width / photo!.size.height
        return tableView.frame.width / photoAspectRatio
    }

}

