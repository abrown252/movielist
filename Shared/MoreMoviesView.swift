//
//  MoreMoviesView.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import SwiftUI

struct MoreMoviesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for you")
                .font(.title3).fontWeight(.semibold)
            Divider()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(MovieStore.allMovies) { movie in
                        VStack(alignment: .leading) {
                            Image(movie.movieImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .shadow(radius: 5)
                        }
                        .frame(width: 100, height: 160)
                        .mask(RoundedRectangle(cornerRadius: 6))
                        .clipped()
                    }
                }
            }
        }
    }
}

struct MoreMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoreMoviesView()
    }
}
