//
//  MovieListWidget.swift
//  MovieListWidget
//
//  Created by Alex Brown on 26/06/2020.
//

import WidgetKit
import SwiftUI
import Intents

class MovieWidgetProvider: TimelineProvider {
        
    var movieUpdater: MovieUpdater = MovieUpdater()
        
    func timeline(with context: Context, completion: @escaping (Timeline<MovieEntry>) -> ()) {
        // Create a timeline entry for "now."
        let date = Date()
        let entry = MovieEntry(date: date, movie: movieUpdater.movie)

        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: date)!

        // Create the timeline with the entry and a reload policy with the date
        // for the next update.
        let timeline = Timeline(
            entries: [entry],
            policy: .after(nextUpdateDate)
        )

        // Call the completion to pass the timeline to WidgetKit.
        completion(timeline)
    }
        
    func snapshot(with context: Context, completion: @escaping (MovieEntry) -> ()) {
                
        let date = Date()
        let entry = MovieEntry(date: date, movie: movieUpdater.movie)
        
        completion(entry)
    }
        
}

class MovieUpdater {
    var movie: Movie = Movie.empty
    var lastMovieUpdateTime: Date = Date()
    var timer: Timer? = nil
    
    init() {
        self.getNextMovie()
        self.timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { [weak self] (timer) in
            self?.getNextMovie()
        })
    }
    
    func getNextMovie() {
        let range = (0...MovieStore.allMovies.count - 1)
        let randomIndexInRange = Int.random(in: range)
        self.movie = MovieStore.allMovies[randomIndexInRange]
    }
}

struct MovieEntry: TimelineEntry {
    public let date: Date
    public let movie: Movie
}

struct PlaceholderView : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight: .infinity)
                .foregroundColor(.gray)
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 20)
                    .foregroundColor(.gray)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct MovieListWidgetEntryView : View {
    var entry: MovieWidgetProvider.Entry

    var body: some View {
        ZStack {
            Image(entry.movie.movieImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight: .infinity)
            
            VStack {
                Spacer()
                LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .clear, location: 0), Gradient.Stop(color: Color.black.opacity(0.95), location: 0.6)]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 100)
            }
            VStack(alignment: .leading) {
                Spacer()
                Text(entry.movie.name)
                    .padding(.all, 10)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

@main
struct MovieListWidget: Widget {
    private let kind: String = "MovieListWidget"
        
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MovieWidgetProvider(), placeholder: PlaceholderView()) { entry in
            MovieListWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Movie Widget")
        .description("Movies you need to see")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
