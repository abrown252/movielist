//
//  Movie.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import Foundation

struct Movie: MenuListItem, Identifiable {
    var id = UUID()
    var name: String
    
    var iconName: String? = nil
    var children: [MenuListItem]? = nil
    var isHeader: Bool = false
    var tag: MenuItemTag = .movie
        
    let movieImageName: String
    let releaseDate: String
    var longDescription: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pretium sapien a risus scelerisque, et efficitur diam dapibus. Duis convallis quam a nulla tincidunt egestas. Nunc faucibus lorem sit amet nisl malesuada maximus. In dapibus fermentum purus ac pulvinar. Mauris in molestie turpis. Sed sodales magna non tincidunt tempor. Suspendisse posuere luctus ipsum, eget scelerisque quam ultricies id. Duis sodales, arcu at sagittis malesuada, arcu tortor sollicitudin felis, et ultrices nisi odio eget elit."
    let genres: [Genre]
    
    static var empty: Movie {
        Movie(name: "", movieImageName: "", releaseDate: "", genres: [Genre]())
    }
    
    init(name: String, movieImageName: String, releaseDate: String, genres: [Genre]) {
        self.name = name
        self.movieImageName = movieImageName
        self.releaseDate = releaseDate
        self.genres = genres
    }
}
