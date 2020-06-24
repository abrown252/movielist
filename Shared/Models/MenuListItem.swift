//
//  MenuListItem.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import Foundation

enum MenuItemTag {
    case all
    case header
    case movie
    case genre
}

protocol MenuListItem {
    var id: UUID {get}
    var name: String {get}
    var iconName: String? {get}
    var children: [MenuListItem]? {get}
    var isHeader: Bool {get}
    var tag: MenuItemTag {get}
}
