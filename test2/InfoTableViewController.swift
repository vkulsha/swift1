//
//  InfoTableViewController.swift
//  test2
//
//  Created by Птичка on 26/12/2018.
//  Copyright © 2018 Птичка. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    var modelArray = [[String?]]()
    
    func reloadData(_ id: String = "1") {
        let url = URL(string: "http://kulsha.ru/php/olp.php?f=gAnd&p=[[\(id)]]&u=41000")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode([[String?]].self, from: data)
                self.modelArray = json
                self.tableView.reloadData()
 
            } catch let error {
                print(error)
            }
            
        }
        task.resume()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "InfoCell")
        reloadData()

       // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return modelArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! TableViewCell
        cell.id = modelArray[indexPath.row][0] ?? ""
        cell.n = modelArray[indexPath.row][1] ?? ""
        cell.textLabel?.text = modelArray[indexPath.row][1] ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        reloadData(cell.id)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
