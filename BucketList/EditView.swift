  //
  //  EditView.swift
  //  BucketList
  //
  //  Created by Simran Preet Narang on 2022-06-18.
  //

import SwiftUI

struct EditView: View {
  
  enum LoadingState {
    case loading, loaded, failed
  }
  
  
  @Environment(\.dismiss) var dismiss
  
  var location: Location
  var onSaveClosure: (Location) -> Void
  
  @State private var name: String
  @State private var description: String
  
  @State private var loadingState = LoadingState.loaded
  @State private var pages = [Page]()
  
  init(location: Location, onSave: @escaping (Location) -> Void) {
    self.location = location
    self.onSaveClosure = onSave
    
    _name = State(initialValue: location.name)
    _description = State(initialValue: location.description)
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Name", text: $name)
          TextField("Description", text: $description)
        }
        
        Section("Nearby...") {
          switch loadingState {
            case .loading:
              Text("loading..")
            case .loaded:
              ForEach(pages, id: \.padeid) { page in
                Text(page.title)
                  .font(.headline)
                +
                Text(":")
                +
                Text(page.description)
                  .italic()
              }
            case .failed:
              Text("Please try again later.")
          }
        }
      }
      .navigationTitle("Place Details")
      .toolbar {
        Button("Save") {
          var newLocation = location
          newLocation.id = UUID()
          newLocation.name = name
          newLocation.description = description
          onSaveClosure(newLocation)
          dismiss()
        }
      }
      .task {
        await fetchNearbyPlaces()
      }
    }
  }
  
  func fetchNearbyPlaces() async {
    let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
    
    guard let url = URL(string: urlString) else {
      print("Bad URL")
      return
    }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let items = try JSONDecoder().decode(Result.self, from: data)
      pages = items.query.pages.values.sorted()
      loadingState = .loaded
    } catch {
      print("???", error)
      loadingState = .failed
    }

  }
}

struct EditView_Previews: PreviewProvider {
  static var previews: some View {
    EditView(location: Location.example, onSave: {_ in })
  }
}
