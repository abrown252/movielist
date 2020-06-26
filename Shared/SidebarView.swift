//
//  ContentView.swift
//  Shared
//
//  Created by Alex Brown on 24/06/2020.
//

import SwiftUI

struct SidebarView: View {
            
    let listItems: [MenuListItem] = [
        MenuItem(name: "All Movies", tag: .all, iconName: "film", children: nil),
        MenuItem(name: "Favorites",  tag: .header, iconName: "star.fill", children: MovieStore.favorites),
        MenuItem(name: "Watch list", tag: .header, iconName: "eyeglasses", children: MovieStore.watchList),
        MenuItem(name: "Genres", tag: .genre, iconName: "line.horizontal.3.decrease.circle", children: Genre.all.map { MenuItem(name: $0.rawValue, tag: .genre) }),
        MenuItem(name: "Collections", tag: .header, iconName: "square.grid.2x2", children: MovieStore.favorites),
    ]
    
    var body: some View {
        List(listItems, id: \.id, children: \.children) { menuItem in
            if menuItem.isHeader {
                Label(menuItem.name, systemImage: menuItem.iconName ?? "")
            } else {
                if let movie = menuItem as? Movie {
                    NavigationLink(
                        destination: MovieView(movie: movie),
                        label: {
                            Label(menuItem.name, systemImage: menuItem.iconName ?? "")
                        })
                } else {
                    let movies = MovieStore.movies(for: Genre(rawValue: menuItem.name)) ?? MovieStore.allMovies
                    NavigationLink(
                        destination: MoviesView(movies: movies),
                        label: {
                            Label(menuItem.name, systemImage: menuItem.iconName ?? "")
                        })
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Movies")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SidebarView()
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
            SidebarView()
        }
    }
}
