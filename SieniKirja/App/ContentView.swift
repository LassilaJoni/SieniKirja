//
//  ContentView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @State private var searchText = ""
    
    let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    @StateObject var favorites = Favorites()
    
    var body: some View {
        
       
        
        //MARK: - BODY
       
        NavigationView {
            VStack {
            
            
            
            List {
                
                /*CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            */
                
                ForEach(filteredMushrooms) { mushroom in
                    NavigationLink(destination: MushroomDetailView(mushroom: mushroom)) {
                        MushroomListItemView(mushroom: mushroom)
                        if favorites.contains(mushroom) {
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("Suosikeissa oleva sieni")
                                .foregroundColor(.accentColor)
                        }
                    }
                    
                }
                
               
                
            }//: LIST
            .listStyle(.plain)
            .listRowSeparatorTint(.accentColor)
            .navigationTitle("Sienikirja")
            .frame(width: UIScreen.main.bounds.width)
            // Searchbar
            .searchable(text: $searchText, prompt: "Search for a mushroom")
            
            
        
        } //: NAVIGATION
            
            
            
        }
        
       
        .environmentObject(favorites)
    }
    
    var filteredMushrooms: [Mushroom] {
        if searchText.isEmpty {
            return mushrooms
        } else {
            return mushrooms.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
        
}
