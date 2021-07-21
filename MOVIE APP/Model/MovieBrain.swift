//
//  MovieModel.swift
//  MOVIE APP
//
//  Created by Sankalp Pandey on 17/07/21.
//

import Foundation
import UIKit

struct MovieBrain{
    
// MARK:- API SESSION.
    
    private var dataTask: URLSessionDataTask?
    
    mutating func getPopularMovies(completion: @escaping (Result<MovieModel,Error>) -> Void){
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=df73230183a68f420e4d0a340215dde0"
        guard let url = URL(string: urlString)
        else{
            return
        }
        dataTask = URLSession.shared.dataTask(with: url){(data , response , error) in
            if let error = error{
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            
            guard let respone = response as? HTTPURLResponse else{
                print("empty")
                return
            }
            print(respone.statusCode)
            
            guard let data = data else{
                fatalError()
                return
            }
            
            // MARK:- JSON DECODING
            
            do{
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MovieModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }
            catch{
                print(error)
            }
            
        }
        dataTask?.resume()
    }
    
    }

