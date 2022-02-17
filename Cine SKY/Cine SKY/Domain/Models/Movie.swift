//
//  Movies.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import Foundation


struct Movie: Decodable {
    let id: String
    let title: Title
    let ratings: Ratings
    let genres: [String]
    let releaseDate: String
    let plotOutline: PlotOutline
}

// MARK: - PlotOutline
struct PlotOutline: Decodable {
    let id, text: String
}

// MARK: - Ratings
struct Ratings: Decodable {
    let canRate: Bool
}

// MARK: - Title
struct Title: Decodable {
    let type, id: String
    let image: Image
    let title, titleType: String
    let year: Int
}

// MARK: - Image
struct Image: Decodable {
    let height: Int
    let id: String
    let url: String
    let width: Int
}




//struct Movie: Decodable {
//    let id: String
//    let title: TitleData
//    let ratings: RatingData
//    let genres: [String]
//    let releaseDate: String
//    let plotOutline: plotOutlineData
//}
//
//struct TitleData: Decodable {
//    let image: ImageUrl
//    //let runningTimeInMinutes: Int?
//    let title: String
//    let titleType: String
//    let year: Int
//}
//
//struct ImageUrl: Decodable {
//    let url: String
//}
//
//struct RatingData: Decodable {
//    let canRate: Bool
//    //let rating: Double?
//    //let ratingCount: Int?
//    //let topRank: Int?
//}
//
//struct plotOutlineData: Decodable {
//    let text: String
//}


//
//{
//    "id": "/title/tt5537002/",
//    "title": {
//        "@type": "imdb.api.title.title",
//        "id": "/title/tt5537002/",
//        "image": {
//            "height": 4000,
//            "id": "/title/tt5537002/images/rm2979512577",
//            "url": "https://m.media-amazon.com/images/M/MV5BZmMyMDc4NWMtZmUzNC00ZjczLWE1ZmYtYWQ3ZTk4ODBmYzE2XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
//            "width": 6000
//        },
//        "title": "Killers of the Flower Moon",
//        "titleType": "movie",
//        "year": 2022
//    },
//    "ratings": {
//        "canRate": false
//    },
//    "genres": [
//        "Crime",
//        "Drama",
//        "History",
//        "Mystery",
//        "Thriller",
//        "Western"
//    ],
//    "releaseDate": "2022",
//    "plotOutline": {
//        "id": "/title/tt5537002/plot/po2679630",
//        "text": "Members of the Osage tribe in the United States are murdered under mysterious circumstances in the 1920s sparking a major F.B.I. investigation involving J. Edgar Hoover."
//    }
//}












//"id": "/title/tt7740496/",
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
