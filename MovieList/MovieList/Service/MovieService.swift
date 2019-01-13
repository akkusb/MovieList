//
//  MovieService.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import UIKit

class MovieService: BaseService {
    
    let apiKey = "322e5fc6"
    

    static func getMovieList(query: String, success:@escaping (_ movie:MovieModel?) -> Void, failure:@escaping (_ errorModel:ErrorModel?) -> Void) -> Void {
        
        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            
            let urlString = baseUrl + "&t=" + encodedQuery
            BaseService.get(url: urlString, parameters: nil, success: { (responseData) in
                guard let baseResponse = responseData else{
                    failure(nil)
                    return
                }
                let decoder : JSONDecoder = JSONDecoder()
                do{
                    let movieModel : MovieModel = try decoder.decode(MovieModel.self, from: baseResponse)
                    if let error = movieModel.Error{
                        failure(ErrorModel.init(description: error))
                    }
                    else{
                        success(movieModel)
                    }
                }
                catch{
                    failure(ErrorModel.init(description: "Json Model Parse Error"))
                    
                }
                
            }) { (errorModel) in
                failure(errorModel)
            }
        }
        
    }
}
