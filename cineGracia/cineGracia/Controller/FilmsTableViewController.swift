//
//  FilmsTableViewController.swift
//  cineGracia
//
//  Created by alumne on 28/03/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    let films = [Film(title: "One", duration: "120 minuts", director: "Dragomir", synopsis: "El puto amo", image: "logo.png"), Film(title: "Two", duration: "200 minuts", director: "Xavi", synopsis: "El puto amo sin el amo", image: "logo.png")]
    
    
    let dataBaseResourceFileName:String = "cineGracia.db"
    var databasePath:String=String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpExternalDataBAse()

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
        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = films[indexPath.row].title
        cell.detailTextLabel?.text = films[indexPath.row].duration
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell){
            
            if let navigationController = segue.destination as? UINavigationController, let filmViewController = navigationController.visibleViewController as? FilmViewController{
                
                filmViewController.filmSelected = films[indexPath.row]
            }
        }
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
    }
    
    func setUpExternalDataBAse(){
        let filemanager=FileManager()
        
        if let docsDir=fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
            let databaseURL = docsDir.appendingPathComponent(dataBaseResourceFileName)
            databasePath = databaseURL.absoluteString
            
            if  !fileManager.fileExists(atPath: databasePath){
                if let sourceDateBaseURL = Bundle.main.url(forSource: "cineGracia", withExtension: "db"){
                    do{
                        try fileManager.copyItem(at: sourceDataBaseURL, to: databaseURL)
                        print("database copiada")
                    }catch{
                        pirnt("Error copiando la bbdd")
                    }
                }
            }
        }
    }

}
