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

struct StoreReviewHelper {
    
    static func incrementAppOpenedCount() { // called from appdelegate didfinishLaunchingWithOptions:
        guard var appOpenCount = UserDefaults.standard.value(forKey: UserDefaultsKeys.APP_OPENED_COUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
            return
        }
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
    }
    
    static func checkAndAskForReview() {
        // Call this whenever appropriate.
        // This will not be shown everytime. Apple has some internal logic on how to show this.
        guard let appOpenCount = UserDefaults.standard.value(forKey: UserDefaultsKeys.APP_OPENED_COUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
            return
        }
        
        switch appOpenCount {
        case 10,50:
            StoreReviewHelper().requestReview()
        case _ where appOpenCount%100 == 0 :
            StoreReviewHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
            break;
        }
        
    }
    
    func requestReview() {
        if #available(iOS 14.0, *) {
            if let scene = UIApplication.shared.currentScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            SKStoreReviewController.requestReview()
        }
    }
}

extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}

struct UserDefaultsKeys {
    static let APP_OPENED_COUNT = "APP_OPENED_COUNT"
}
