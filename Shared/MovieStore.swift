//
//  MovieStore.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import Foundation

struct MovieStore {
    
    static var allMovies: [Movie] {
        return favorites + watchList + comingsoon
    }

    static var favorites: [Movie] {
        return [Movie(name: "Avengers: Infinity War", movieImageName: "infinity", releaseDate: "01/06/2018", genres: [.action, .superhero, .scifi]),
                Movie(name: "Avengers: End Game", movieImageName: "endgame", releaseDate: "19/07/2019", genres: [.action, .superhero, .scifi]),
                Movie(name: "Star Wars: Empire Strikes Back", movieImageName: "empire", releaseDate: "01/01/1980", genres: [.action, .scifi]),
                Movie(name: "Star Wars: Rise of Skywalker", movieImageName: "ros", releaseDate: "01/12/2019", genres: [.action, .superhero, .scifi])]
    }
 
    static var watchList: [Movie] {
        return [Movie(name: "Onward", movieImageName: "onward", releaseDate: "01/06/2020", genres: [.family]),
                Movie(name: "Black Widow", movieImageName: "bw", releaseDate: "10/10/2020", genres: [.action, .superhero, .scifi]),
                Movie(name: "Mulan", movieImageName: "mulan", releaseDate: "17/07/2020", genres: [.family, .action]),
                Movie(name: "Guardians of the Galaxy: Vol 3", movieImageName: "gog3", releaseDate: "06/06/2020", genres: [.action, .superhero, .scifi])]
    }

    static var comingsoon: [Movie] {
        return [Movie(name: "Free Solo", movieImageName: "solo", releaseDate: "01/11/2021", genres: [.documentary]),
                Movie(name: "James Bond: No Time To Die", movieImageName: "nttd", releaseDate: "12/03/2021", genres: [.action]),
                Movie(name: "Always be my Maybe", movieImageName: "always", releaseDate: "09/04/2021", genres: [.family, .romcom])]
    }
    
    static func movies(for genre: Genre?) -> [Movie]? {
        guard let genre = genre
            else {return nil}
        
        return allMovies.filter { $0.genres.contains(genre) }
    }
}
