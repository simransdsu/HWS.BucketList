//
//  ContentView.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-17.
//

import SwiftUI
import MapKit

struct ContentView: View {
  
  @StateObject var viewModel = ContentView.ViewModel()
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
        MapAnnotation(coordinate: location.coordinate) {
          VStack {
            Image(systemName: "star.circle")
              .resizable()
              .foregroundColor(.red)
              .frame(width: 44, height: 44)
              .background(.white)
              .clipShape(Circle())
            Text(location.name)
              .fixedSize()
          }
          .onTapGesture {
            viewModel.selectedPlace = location
          }
        }
      }
        .ignoresSafeArea()
      
      Circle()
        .fill(.blue)
        .opacity(0.3)
        .frame(width: 32, height: 32)
      
      floatingAddButton
    }
    .sheet(item: $viewModel.selectedPlace) { selectedPlace in
      EditView(location: selectedPlace) { newLocation in
        if let index = viewModel.locations.firstIndex(of: selectedPlace) {
          viewModel.updateLocation(location: newLocation, at: index)
        }
      }
    }
  }
  
  private var floatingAddButton: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        Button {
          viewModel.addLocation()
        } label: {
          Image(systemName: "plus")
            .padding()
            .background(.black.opacity(0.75))
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .padding()
        }
      }
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
