//
//  MovieView.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(movie.movieImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text(movie.releaseDate)
                        .font(.subheadline).fontWeight(.medium)
                        .padding(.bottom, 10)
                    
                    Text(movie.longDescription)
                        .font(.body)
                }
                Spacer()
            }
            
            Spacer()
            MoreMoviesView()
        }
        .navigationBarTitle(movie.name)
        .padding()
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(name: "Avengers: Endgame", movieImageName: "endgame", releaseDate: "01/01/2020", genres: [.superhero, .action])
        return MovieView(movie: movie)
    }
}
