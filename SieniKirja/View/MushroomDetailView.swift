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
            Image("cover-akansieni")
                .resizable()
                .scaledToFit()
            
            // TITLE
            Text("Akansieni")
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
            
            Text("Chlorophyllum olivieri")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.horizontal)
            
            // GALLERY
            
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Kuvat luonnossa")
            }
            
            // EDIBLE
            
            // DESCRIPTION
            
            // LINK TO WIKIPEDIA
            
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
