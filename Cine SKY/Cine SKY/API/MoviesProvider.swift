//
//  MoviesProvider.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import Foundation
import Alamofire

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
                
                    
                    // MARK: aqui, so pode 5 por segundo
                    self.getMovieBy(id: newElement) { //movie in
                        //formattedList.append(movie)
                    }
                }
                
                completion(formattedList)
                
                
            } catch {
                print("JSONDecoder error")
            }
        }
    }
    
    func getMovieBy(id: String, completion: @escaping() -> Void) {
        
        let url = MovieUrl + "?tconst=\(id)"
        
        print(url)
        
        AF.request(url ,method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { res in
            guard let data = res.data  else { return }
            
            do {
                //let jsonResponse = try JSONDecoder().decode(Movie.self, from: data)
                let teste = try JSONSerialization.jsonObject(with: data, options: [])
                print(teste)
    
                completion()
                
            } catch {
                print("JSONDecoder error getMovieBy")
            }
                
        }
    }
}




//
//{
//    "id": "/title/tt7740496/",
//    "title": {
//        "@type": "imdb.api.title.title",
//        "id": "/title/tt7740496/",
//        "image": {
//            "height": 1500,
//            "id": "/title/tt7740496/images/rm749334273",
//            "url": "https://m.media-amazon.com/images/M/MV5BOTI4NDhhNGEtZjQxZC00ZTRmLThmZTctOGJmY2ZlOTc0ZGY0XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
//            "width": 1012
//        },
//        "runningTimeInMinutes": 150,
//        "title": "Nightmare Alley",
//        "titleType": "movie",
//        "year": 2021
//    },
//    "certificates": {
//        "US": [
//            {
//                "certificate": "R",
//                "certificateNumber": 53284,
//                "ratingReason": "Rated R for strong/bloody violence, some sexual content, nudity and language",
//                "ratingsBody": "MPAA",
//                "country": "US"
//            }
//        ]
//    },
//    "ratings": {
//        "canRate": true,
//        "rating": 7.2,
//        "ratingCount": 54387,
//        "topRank": 1939
//    },
//    "genres": [
//        "Crime",
//        "Drama",
//        "Thriller"
//    ],
//    "releaseDate": "2021-12-17",
//    "plotOutline": {
//        "id": "/title/tt7740496/plot/po3644569",
//        "text": "An ambitious carny with a talent for manipulating people with a few well-chosen words hooks up with a female psychiatrist who is even more dangerous than he is."
//    },
//    "plotSummary": {
//        "author": "Frank Liesenborgs",
//        "id": "/title/tt7740496/plot/ps6343636",
//        "text": "Stan burns down his home and takes a job as a carny with a traveling carnival. Stan is disturbed at how any man could sink to the level of performing as a geek. Clem explains that he seeks out alcoholic or drug-addicted men with troubled pasts, and lures them in with promises of a \"temporary\" job and opium-laced alcohol. He then uses their dependence until they sink into madness and depravity, thus creating a new geek. Stan also works with clairvoyant act \"Madame Zeena\" and her alcoholic husband, Pete. He and Zeena warn Stan not to ever use these skills otherwise people get hurt. Meanwhile Stan becomes attracted to fellow performer Molly and approaches her with an idea for a two-person act away from the carnival."
//    }
//}
