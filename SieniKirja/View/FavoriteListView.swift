//
//  FavoriteListView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 20.5.2022.
//

import SwiftUI


struct FavoriteListView: View {
    
    let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    @EnvironmentObject var favorites: Favorites

    
    var body: some View {
        List {
            ForEach(mushrooms) { mushroom in
           
                    if favorites.contains(mushroom) {
                        NavigationLink(destination: MushroomDetailView(mushroom: mushroom)) {
                            MushroomListItemView(mushroom: mushroom)
                        Image(systemName: "heart.fill")
                            .accessibilityLabel("Suosikeissa oleva sieni")
                            .foregroundColor(.accentColor)
                    }
                }
                
            }
            
            
        } //: LIST
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    static var previews: some View {
        
        FavoriteListView()
            .environmentObject(Favorites())
    }
}
