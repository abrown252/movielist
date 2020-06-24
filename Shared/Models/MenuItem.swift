//
//  MenuItem.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import Foundation

struct MenuItem: MenuListItem, Identifiable {
    var id = UUID()
    let name: String
    var tag: MenuItemTag
    let iconName: String?
    let children: [MenuListItem]?
    
    
    var isHeader: Bool {
        return children != nil
    }
    
    init(name: String, tag: MenuItemTag, iconName: String? = nil, children: [MenuListItem]? = nil) {
        self.name = name
        self.tag = tag
        self.iconName = iconName
        self.children = children
    }
}
