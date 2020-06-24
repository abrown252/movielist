//
//  AllMoviesView.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import SwiftUI

struct MoviesView: View {
    
    let movies: [Movie]
    
    init(movies: [Movie] = MovieStore.allMovies) {
        self.movies = movies
    }
    
    var body: some View {
        VStack {
            if movies.isEmpty {
                HStack {
                    Image(systemName: "line.horizontal.3.decrease.circle.fill")
                    Text("No movies exist with filter")
                }
            } else {
                List(movies) { movie in
                    NavigationLink(
                        destination: MovieView(movie: movie),
                        label: {
                            HStack {
                                Image(movie.movieImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .mask(RoundedRectangle(cornerRadius: 5))
                                    
                                VStack(alignment: .leading) {
                                    Text(movie.name)
                                        .font(.headline).fontWeight(.semibold)
                                    Text(movie.releaseDate)
                                        .font(.caption).italic()
                                        .padding(.bottom, 10)
                                    Text(movie.longDescription)
                                        .font(.subheadline)
                                        .lineLimit(3)
                                    Spacer()
                                }
                            }
                            .padding(.trailing, 20)
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .navigationTitle("Movies")
    }
}

struct AllMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
