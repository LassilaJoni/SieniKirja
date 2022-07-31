//
//  ContentView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @State private var searchText = ""
    
    @State private var isShowingFavoritesPage = false
    @State var alertShouldBeShown = !UserDefaults.standard.bool(forKey: "FirstStart")
    
    
    @Environment(\.openURL) var openURL
    
    @State private var showingSheet = false
    
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
                .onAppear(perform: {requestReview()
                })
                .alert(isPresented: $alertShouldBeShown, content: {
                    
                    Alert(title: Text("Kiitos sovelluksen lataamisesta"),
                          message: Text("Kuvissa saattaa kestää hieman ladata sillä ne tulevat palvelimelta, mutta kerran ladattua ei tarvitse enään odottaa 😊"),
                          dismissButton: Alert.Button.default(
                            Text("Jatka"), action: {
                                UserDefaults.standard.set(true, forKey: "FirstStart")
                            })
                    )
                })
                .listStyle(.plain)
                .listRowSeparatorTint(.accentColor)
                .navigationTitle("Sienikirja")
                .frame(width: UIScreen.main.bounds.width)
                
                // Searchbar
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Etsi sieniä")
                .disableAutocorrection(true)
                
                
                .toolbar {
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(destination: FavoriteListView()) {
                            Image(systemName: "heart.fill")
                            
                        }
                        
                    }
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                                   self.showingSheet.toggle()
                               }) {
                                   Image(systemName: "gear")
                               }.sheet(isPresented: $showingSheet) {
                                   InfoView()
                               }
                    }
                    
                }
                
                
                
                
                
                
                
                
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
    
    
extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}


func requestReview() {
    var count = UserDefaults.standard.integer(forKey: UserDefaultKeys.appStartUpsCountKey)
    count += 1
    print("App launch count")
    UserDefaults.standard.set(count, forKey: UserDefaultKeys.appStartUpsCountKey)
    
    let infoDictionaryKey = kCFBundleVersionKey as String
    guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
        else { fatalError("Expected to find a bundle version in the info dictionary") }

    let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: UserDefaultKeys.lastVersionPromptedForReviewKey)
    
    if count >= 3 && currentVersion != lastVersionPromptedForReview {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}
