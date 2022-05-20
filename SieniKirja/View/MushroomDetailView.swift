//
//  MushroomDetailView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import UIKit
import SwiftUI

struct MushroomDetailView: View {
    
    let mushroom: Mushroom
    
    @EnvironmentObject var favorites: Favorites

    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 10) {
                    
                // IMAGE
                 Image(mushroom.image)
                   .resizable()
                   .scaledToFit()
                   //.frame(width: UIScreen.main.bounds.size.width * 1, height: UIScreen.main.bounds.size.height * 0.5)
                   .pinchToZoom()
                   
                    
                    
                        
                    
                        
                // TITLE
                Text(mushroom.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 0)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 5)
                            .offset(y: 20))
                
                
                // LATIN NAME
                
                Text(mushroom.latinName)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
            
                
                // EDIBLE
                Group {
                    MushroomEdibleView(edibleImage: "exclamationmark.circle", edibleText: "edible", mushroom: mushroom)
                }
                
                
                // GALLERY
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle", headingText: "Kuvat luonnossa")
                    
                    InsetGalleryView(mushroom: mushroom)
                        
                }
            
                
                // DESCRIPTION
                Group {
                HeadingView(headingImage: "info.circle", headingText: "Lisätietoa")
                
                Text(mushroom.description)
                    .multilineTextAlignment(.leading)

                }
                .padding(.horizontal)
                
                
                
                // LINK TO WIKIPEDIA
                
                Group {
                    HeadingView(headingImage: "book.circle", headingText: "Lue lisää")
                    ExternalWebLink(mushroom: mushroom)
                }
                    
                    
                
            }
                Button(favorites.contains(mushroom) ? "Poista suosikeista" : "Lisää suosikkeihin") {
                    if favorites.contains(mushroom) {
                        favorites.remove(mushroom)
                    } else {
                        favorites.add(mushroom)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            
               
        } //: VSTACK
    }//: SCROLL
    
}


struct MushroomDetailView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        NavigationView {
            MushroomDetailView(mushroom: mushrooms[0])
        }
        .environmentObject(Favorites())
        .previewDevice("iPhone 11 Pro")
    }
}
