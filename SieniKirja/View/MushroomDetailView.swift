//
//  MushroomDetailView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct MushroomDetailView: View {
    
    
    let mushroom: Mushroom
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // IMAGE
            Image(mushroom.image)
                .resizable()
                .scaledToFit()
            
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
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Kuvat luonnossa")
                
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
            
        } //: SCROLLVIEW
    }
}

struct MushroomDetailView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        NavigationView {
            MushroomDetailView(mushroom: mushrooms[0])
        }
    }
}
