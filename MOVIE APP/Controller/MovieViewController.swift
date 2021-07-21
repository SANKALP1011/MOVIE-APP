//
//  ViewController.swift
//  MOVIE APP
//
//  Created by Sankalp Pandey on 16/07/21.
//

import UIKit

class MovieViewController: UIViewController {
var movieBrain = MovieBrain()
    var movieView = MovieView()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 280
        loadPopularMovies()
        
    }

    func loadPopularMovies(){
        movieView.popilarMovieData {
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
   
}

// MARK:- MOVIE TABLE VIEW

extension MovieViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieView.numberOfRowsInSection(section: section)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let movie = movieView.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
}
        
    
    
    
    
    
}

