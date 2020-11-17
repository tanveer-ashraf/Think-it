//
//  MovieDetailView.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/16/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    init(selectedMovie: Movie) {
        viewModel = MovieDetailViewModel(selectedMovie: selectedMovie)
        viewModel.selectedMovie.created = viewModel.formatDate(date: viewModel.selectedMovie.created)
        viewModel.selectedMovie.edited = viewModel.formatDate(date: viewModel.selectedMovie.created)
    }
    var body: some View {
        
        VStack(spacing:20){
            
            topView(objMovie: self.viewModel.selectedMovie)
            
            VStack(spacing:10){
                
                Text("Opening Crawl")
                .foregroundColor(.black)
                .font(.system(size: 16.0))
                    .frame(maxWidth: .infinity, alignment: .leading)

                
                
                Text(self.viewModel.selectedMovie.openingCrawl)
                .foregroundColor(.black)
                .font(.system(size: 16.0))
                
                
                
                HStack{
                
                    VStack(alignment:.leading){
                        
                        Text("Created")
                            .foregroundColor(.black)
                            .font(.system(size: 11.0))
                        Text(self.viewModel.selectedMovie.created)
                            .foregroundColor(.black)
                            .font(.system(size: 14.0))
                        
                    }
                    
                    VStack(alignment:.leading){
                        
                        Text("Edited")
                            .foregroundColor(.black)
                            .font(.system(size: 11.0))
                        Text(self.viewModel.selectedMovie.edited)
                            .foregroundColor(.black)
                            .font(.system(size: 14.0))
                        
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        
        }
        .navigationBarTitle("\(self.viewModel.selectedMovie.title)", displayMode: .inline)
        .background(Color.white)
        
            
    }
}

struct topView: View {
    let objMovie: Movie
    let whiteColor = Color(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0)
    var body: some View {
        
        VStack(alignment:.leading){

            Text(objMovie.title)
            .foregroundColor(whiteColor)
            .font(.system(size: 26.0))

            Spacer()
            
           HStack{
            
            VStack(alignment:.leading){
                
                Text("Release Date")
                    .foregroundColor(whiteColor)
                    .font(.system(size: 11.0))
                Text(objMovie.releaseDate)
                    .foregroundColor(whiteColor)
                    .font(.system(size: 14.0))
                
            }

            VStack(alignment:.leading){
                
                Text("Director")
                    .foregroundColor(whiteColor)
                    .font(.system(size: 11.0))
                Text(objMovie.director)
                    .foregroundColor(whiteColor)
                    .font(.system(size: 14.0))
                
            }
            
            VStack(alignment:.leading){
                
                Text("Producer")
                    .foregroundColor(whiteColor)
                    .font(.system(size: 11.0))
                Text(objMovie.producer)
                    .foregroundColor(whiteColor)
                    .font(.system(size: 14.0))
                
            }
            Spacer()
            
            }

        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .background(Color.black)
        .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, minHeight: 120, idealHeight: 120, maxHeight: 120, alignment: .topLeading)
    }
}

