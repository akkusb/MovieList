//
//  MovieModel.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import UIKit

struct MovieModel: Codable {
    var Title : String?
    var Year : String?
    var Rated : String?
    var Released : String?
    var Runtime : String?
    var Genre : String?
    var Director : String?
    var Writer : String?
    var Actors : String?
    var Plot : String?
    var Language : String?
    var Country : String?
    var Awards : String?
    var Poster : String? // Poster image url
    var Ratings : [RatingModel]?
    var Metascore : String?
    var imdbRating : String?
    var imdbVotes : String?
    var imdbId : String?
    var `Type` : String?
    var Dvd : String?
    var BoxOffice : String?
    var Production : String?
    var Website : String?
    var Response : String?
    var Error : String?
    
    func getDetailDictionary() -> [String:String] {
        var detailDictionary = [String:String]()
        if let title = Title {
            detailDictionary["Title"] = title
        }
        if let year = Year {
            detailDictionary["Year"] = year
        }
        if let genre = Genre {
            detailDictionary["Genre"] = genre
        }
        if let director = Director {
            detailDictionary["Director"] = director
        }
        if let actors = Actors {
            detailDictionary["Actors"] = actors
        }
        
        return detailDictionary
    }
}

struct RatingModel: Codable {
    var Source : String?
    var Value : String?
}
