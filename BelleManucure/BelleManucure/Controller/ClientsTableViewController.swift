//
//  ClientsTableViewController.swift
//  BelleManucure
//
//  Created by Андрей Коноплёв on 13.12.2021.
//

import UIKit

class ClientsTableViewController: UITableViewController {
    @IBOutlet weak var addClientOutlet: UIBarButtonItem!
    
    
    var clients = ["Pavel Lagov", "Ivan Sergeev","Nataly Fokina"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои клиенты"


//         self.clearsSelectionOnViewWillAppear = false
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addClientAction(_ sender: UIBarButtonItem) {
        callAC()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath)
        cell.textLabel?.text = clients[indexPath.row]
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
extension ClientsTableViewController {
    func callAC() {
        let alertContoller = UIAlertController(title: "Добавьте клиента", message: nil, preferredStyle: .alert)
        alertContoller.addTextField(configurationHandler: nil)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            let newClient = alertContoller.textFields?[0].text
            if let newClient = newClient {
                self.clients.append(newClient)
            }
           
            self.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertContoller.addAction(addAction)
        alertContoller.addAction(cancelAction)
        present(alertContoller, animated: true, completion: nil)
        
    }
}
