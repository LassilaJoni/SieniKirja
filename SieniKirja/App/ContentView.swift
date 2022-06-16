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
    @State private var isShowingFavoritesPage = false
    @State var alertShouldBeShown = !UserDefaults.standard.bool(forKey: "FirstStart")
    @Environment(\.openURL) var openURL
    
    let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    @StateObject var favorites = Favorites()
    
    var body: some View {
        
        
        
        //MARK: - BODY
   
        
               
        
       
        
        NavigationView {
            
            VStack {
                
                
                List {
                    ForEach(filteredMushrooms) { mushroom in
                        NavigationLink(destination: MushroomDetailView(mushroom: mushroom)) {
                            MushroomListItemView(mushroom: mushroom)
                            if favorites.contains(mushroom) {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .accessibilityLabel("Suosikeissa oleva sieni")
                                .foregroundColor(.accentColor)
                                .padding(.leading)
                            }
                        }
                        
                    }
                    
                    
                    
                }//: LIST
                .alert(isPresented: $alertShouldBeShown, content: {
                                
                    Alert(title: Text("Kiitos sovelluksen lataamisesta"),
                    message: Text("Kuvissa saattaa kestää hieman ladata sillä ne tulevat palvelimelta, mutta kun ne kerran on latautunut ei tarvitsee enään odottaa :) \nJos huomaat virheen niin otathan yhteyttä sähköpostilla support@nordicprograms.com"),
                    dismissButton: Alert.Button.default(
                    Text("Jatka"), action: {
                    UserDefaults.standard.set(true, forKey: "FirstStart")
                    })
                )
                })
                .toolbar {
                    NavigationLink(destination: FavoriteListView()) {
                        Image(systemName: "heart.fill")
                        
                    }
                  
                    
                }
                
                
                
                
                .listStyle(.plain)
                .listRowSeparatorTint(.accentColor)
                .navigationTitle("Sienikirja")
                .frame(width: UIScreen.main.bounds.width)
                // Searchbar
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Etsi sieniä")
                .disableAutocorrection(true)
                
                
                
            } //: VSTACK
            
            
            
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
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
