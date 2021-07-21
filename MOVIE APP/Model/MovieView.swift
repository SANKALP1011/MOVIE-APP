//
//  MovieView.swift
//  MOVIE APP
//
//  Created by Sankalp Pandey on 18/07/21.
//

import Foundation
class MovieView{
    private var movieBrain = MovieBrain()
    private var popularMovies = [Movie]()
    
     func popilarMovieData(completion: @escaping () -> ()){
        movieBrain.getPopularMovies {  (result) in
            
            switch result{
            case.success(let listOf):
                self.popularMovies = listOf.movies
                completion()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int{
        if popularMovies.count != 0{
        return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie{
        return popularMovies[indexPath.row]
    }
    
}
