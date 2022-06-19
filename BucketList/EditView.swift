  //
  //  EditView.swift
  //  BucketList
  //
  //  Created by Simran Preet Narang on 2022-06-18.
  //

import SwiftUI

struct EditView: View {
  
  @Environment(\.dismiss) var dismiss
  
  var location: Location
  var onSaveClosure: (Location) -> Void
  
  @State private var name: String
  @State private var description: String
  
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
    }
  }
}

struct EditView_Previews: PreviewProvider {
  static var previews: some View {
    EditView(location: Location.example, onSave: {_ in })
  }
}
