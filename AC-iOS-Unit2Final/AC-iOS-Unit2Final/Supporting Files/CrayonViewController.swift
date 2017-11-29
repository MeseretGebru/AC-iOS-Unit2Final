//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/17/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    // MARK: -
    var allCrayons = [Crayon]()
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    let cellIdentifier = "Crayon Cell"
    
    //MARK: - Instance Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        allCrayons = Crayon.allTheCrayons
    }
   
        
    //MARK: - Table view DataSource methode
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let crayon = Crayon.allTheCrayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.contentView.backgroundColor = UIColor(red: CGFloat(crayon.red)/255, green: CGFloat(crayon.green)/255 , blue: CGFloat(crayon.blue)/255, alpha: 1)
        return cell
    }


    //MARK: - Navigation Controller Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as? DetailedColorViewController
        let indexPathRow = tableView.indexPathForSelectedRow?.row
        let selectedCrayon = Crayon.allTheCrayons[indexPathRow!]
        //print("Helloooooooo")
        detailVC?.crayon = selectedCrayon
        //print("Helloooooooo")
        
    }

}

