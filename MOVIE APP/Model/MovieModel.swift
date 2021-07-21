//
//  MovieModel.swift
//  MOVIE APP
//
//  Created by Sankalp Pandey on 17/07/21.
//

import Foundation
import UIKit
struct MovieModel: Codable{
    let movies: [Movie]
    private enum CodingKeys: String , CodingKey{
        case movies = "results"
    }
}
struct Movie: Codable{
    let title: String
    let posterIMAGE: String
    let overview: String
    
    private enum CodingKeys: String, CodingKey{
        case title , overview
        case posterIMAGE = "poster_path"
    }
}
