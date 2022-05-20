//
//  ContentView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    @StateObject var favorites = Favorites()
    
    var body: some View {
        
       
        
        //MARK: - BODY
        
        NavigationView {
            
            
            List {
                
                CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
                
                ForEach(mushrooms) { mushroom in
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
            .navigationBarTitle("Sienikirja", displayMode: .large)
            .frame(width: UIScreen.main.bounds.width)
            
            
        
        } //: NAVIGATION
        
        
        .environmentObject(favorites)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
        
}
