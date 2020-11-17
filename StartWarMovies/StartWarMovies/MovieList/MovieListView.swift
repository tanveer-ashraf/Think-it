//
//  MovieListView.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    let whiteColor = Color(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0)
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Image("star_wars_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.all, 10.0)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.2)
                
                HStack{
                    
                    Text("Total \(self.viewModel.movies.count) Movies")
                    Spacer()
                }
                .foregroundColor(whiteColor)
                
                List(self.viewModel.movies)
                { movie in
                              
                    VStack{
                        
                        MovieListRow(objMovie: movie)
                        NavigationLink(destination: MovieDetailView(selectedMovie: movie) ) {
                            EmptyView()
                        }
                    }
                    }
            
        }
            .navigationBarTitle("Think-it Star Wars", displayMode: .inline)
            .background(Color.black)
            
        }
            
        .onAppear {
            
            self.viewModel.getMovieList()
            
        }
    }
}

struct MovieListRow: View {
    let objMovie: Movie
    
    var body: some View {
        
        VStack(alignment:.leading){

            Rectangle()
                .frame( maxWidth: .infinity, minHeight: 0, maxHeight: 5.0, alignment: .topLeading)
                .foregroundColor(.white)

            HStack{

                Text(objMovie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 24.0))

                Spacer()

                VStack(alignment:.leading){

                     Text("Release Date")
                        .foregroundColor(.white)
                        .font(.system(size: 11.0))
                    Text(objMovie.releaseDate)
                        .foregroundColor(.white)
                        .font(.system(size: 14.0))

                }





            }

            Spacer()

            HStack{

                VStack(alignment:.leading){

                     Text("Director")
                        .foregroundColor(.white)
                        .font(.system(size: 11.0))
                    Text(objMovie.director)
                        .foregroundColor(.white)
                        .font(.system(size: 14.0))

                }

                VStack(alignment:.leading){

                     Text("Producer")
                        .foregroundColor(.white)
                        .font(.system(size: 11.0))
                    Text(objMovie.producer)
                        .foregroundColor(.white)
                        .font(.system(size: 14.0))

                }

                Spacer()
            }

            Spacer()

            Text(objMovie.openingCrawl)
            .foregroundColor(.white)
            .font(.system(size: 14.0))

        }
        .frame( maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
