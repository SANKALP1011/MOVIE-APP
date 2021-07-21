//
//  MovieTableViewCell.swift
//  MOVIE APP
//
//  Created by Sankalp Pandey on 18/07/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell  {
    
   
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
private var urlString = ""
    func setCellWithValuesOf(_ movie: Movie){
        updateUI(title: movie.title, overview: movie.overview, poster: movie.posterIMAGE)
    }
    
    private func updateUI(title: String , overview: String , poster: String?){
        self.movieTitle.text = title
        self.movieOverview.text = overview
        
        
        
        guard let posterString = poster else{
            return
        }
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageUrl = URL(string: urlString)
        else{
            self.moviePoster.image = UIImage(named: "No image Available")
            return
        }
        
        self.moviePoster.image = nil
        getImageFromUrl(url: posterImageUrl)
        
        func getImageFromUrl(url: URL){
            URLSession.shared.dataTask(with: url) { (data , response , error) in
                if let error = error{
                    print(error)
                    return
                }
                
                guard let data = data else{
                    print("empty data")
                    return
                }
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data){
                        self.moviePoster.image = image
                    }
                }
                
            }
            .resume()
        }
    }


}



