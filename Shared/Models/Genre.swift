//
//  Genre.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import Foundation

enum Genre: String {
    case action = "Action"
    case scifi = "Scifi"
    case romcom = "Romantic Comedy"
    case documentary = "Documentary"
    case superhero = "Superhero"
    case family = "Family"
    
    static var all: [Genre] = [.action, .scifi, .romcom, .documentary, .superhero, .family]
}
