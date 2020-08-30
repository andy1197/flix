//
//  MoviesViewController.swift
//  flixster
//
//  Created by Andy Wang on 8/30/20.
//  Copyright © 2020 andywang1197@icloud.com. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // "for this particular row, give me the cell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.synopsisLabel.text = synopsis
        cell.titleLabel.text = title
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
    }
    
    
    // outlets
     
    @IBOutlet weak var tableView: UITableView!
    
    
    // properties: available for the lifetime of that screen
    
    var movies = [[String:Any]]()
    
    // Tim: "Special function that runs the first time a screen appears
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            // access specific key in dictionary; cast as an array of dictionaries
            self.movies = dataDictionary["results"] as! [[String:Any]]
            
            self.tableView.reloadData()
            
            print(dataDictionary)
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()

    }
}
