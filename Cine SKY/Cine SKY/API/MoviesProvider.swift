//
//  MoviesProvider.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class MoviesProvider {

    let headers: HTTPHeaders = [
        "x-rapidapi-key": ApiKey,
        "x-rapidapi-host": "imdb8.p.rapidapi.com",
    ]

    func getMostPopularMoviesId(completion: @escaping([Movie]) -> Void) {
        AF.request(MostPopularUrl, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { res in
            
            guard let data = res.data else { return }
            
            do {
                let list = try JSONDecoder().decode([String].self, from: data)
                
                var formattedList: [Movie] = []
                
                for element in list {
                    var newElement = element.replacingOccurrences(of: "/title/", with: "")
                    newElement = newElement.replacingOccurrences(of: "/", with: "")
                
                    self.getMovieBy(id: newElement) { movie in
                        formattedList.append(movie)
                    }
                }
                
                sleep(3)
                completion(formattedList)
        
                
            } catch {
                print("JSONDecoder error")
            }
        }
    }
    
    func getMovieBy(id: String, completion: @escaping(Movie) -> Void) {
        let url = MovieUrl + "?tconst=\(id)"

        let header = [
            "x-rapidapi-host": "imdb8.p.rapidapi.com",
            "x-rapidapi-key": ApiKey
        ]

        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0 )

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
            if(error != nil) {
                print(error)

            } else {
                
                guard let data = data else { return }


                do {
                    
                    let json = try JSON(data: data)
                    let data = try json.rawData()
                    let movieObj = try JSONDecoder().decode(Movie.self, from: data)
                    
                    //print(movieObj)
                    completion(movieObj)
                    

                } catch {
                    print("JSONDecoder error getMovieBy")
                }
            }
        }
        dataTask.resume()
    }
}

