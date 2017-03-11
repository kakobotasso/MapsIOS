//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 08/03/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    var dataSource: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = 106
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 22))
        label.text = "Sem filmes"
        label.textAlignment = .center
        label.textColor = .white
        
        tableView.backgroundView = label
        
        
        loadLocalJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieViewController
        vc.movie = dataSource[tableView.indexPathForSelectedRow!.row]
    }
    
    // MAKK: - Methods
    func loadLocalJSON() {
        if let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") {
            let data: Data = try! Data(contentsOf: jsonURL)
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
            for item in json {
                let title = item["title"] as! String
                let duration = item["duration"] as! String
                let summary = item["summary"] as! String
                let imageName = item["image_name"] as! String
                let rating = item["rating"] as! Double
                
                let movie = Movie(title: title, rating: rating, summary: summary, duration: duration, imageName: imageName)
                movie.categories = item["categories"] as! [String]
                dataSource.append(movie)
            }
            tableView.backgroundView = nil
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell

        cell.ivPoster.image = UIImage(named: dataSource[indexPath.row].imageSmall)
        cell.lbTitle.text = dataSource[indexPath.row].title
        cell.lbRating.text = "\(dataSource[indexPath.row].rating)"
        cell.lbSummary.text = dataSource[indexPath.row].summary
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
