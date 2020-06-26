//
//  NewMovieView.swift
//  MovieList
//
//  Created by Alex Brown on 25/06/2020.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    let screenSize: CGSize = UIScreen.main.bounds.size
    @State var date: Date = Date()
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    ZStack(alignment: .top) {
                        Image(movie.movieImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(minHeight: 0, maxHeight: .infinity)
                            .shadow(color: .purple, radius: 50)
                            .clipped()
                            .padding(.vertical, 40)
                        VStack {
                            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color.black.opacity(0.95), location: 0), Gradient.Stop(color: .clear, location: 1)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: screenSize.height * 0.25)
                            Spacer()
                            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .clear, location: 0), Gradient.Stop(color: Color.black.opacity(0.95), location: 0.6)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: 300)
                        }
                    }
                    .background(Color.black)
                    Spacer()
                }
                VStack {
                    Spacer()
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(movie.name)
                                .font(.largeTitle).fontWeight(.semibold)
                            Text(movie.releaseDate)
                                .font(.subheadline).fontWeight(.medium)
                            Divider()
                            Text(movie.longDescription)
                                .lineLimit(3)
                                .font(.body)
                                
                        }
                        .foregroundColor(.white)
                        .padding(.all, 20)
                    }
                }
            }
            .frame(height: screenSize.height * 0.75)
            Spacer()
//            MoreMoviesView()
//                .padding(.all, 10)
        }
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct NewMovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(name: "Avengers: Endgame", movieImageName: "endgame", releaseDate: "01/01/2020", genres: [.superhero, .action])
        return Group {
            MovieView(movie: movie)
        }
    }
}
