//
//  MushroomDetailView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import UIKit
import SwiftUI
import SDWebImageSwiftUI

struct MushroomDetailView: View {
    
    let mushroom: Mushroom
    
  
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                
                // IMAGE
                WebImage(url: URL(string: mushroom.image))
                    .resizable()
                    .scaledToFit()
                //.frame(width: UIScreen.main.bounds.size.width * 1, height: UIScreen.main.bounds.size.height * 0.5)
                
                
                
                // TITLE
                Text(mushroom.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 0)
                    .foregroundColor(.primary)
                    .lineLimit(1)
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
                /*Group {
                    //MushroomEdibleView(edibleImage: "exclamationmark.circle", edibleText: "edible", mushroom: mushroom)
                    
                }*/
                
                
                // GALLERY
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle", headingText: "Kuvat luonnossa")
                    
                    InsetGalleryView(mushroom: mushroom)
                    
                }
                
                
                // DESCRIPTION

                Group {
                    HeadingView(headingImage: "info.circle", headingText: "Lisätietoa")
                
            
                    if mushroom.description != "null" && mushroom.description != "Not found" {
                    Text(mushroom.description)
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .lineSpacing(5)
                    }
                    //TabView (Spreadiness, environemnt, observation count)
                    InsetExtraInfoView(mushroom: mushroom)
                    
                    //List of the extra information (Spore, sporangia etc)
                    if mushroom.extraInfo != "null" && mushroom.extraInfo != "Not found" {
                    Text(mushroom.extraInfo)
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .lineSpacing(5)
                }
            }
                .padding(.horizontal)
     
                
                if mushroom.spores != "null" && mushroom.spores != "Not found" {
                    GroupBox {
                        VStack {
                            HStack {
                                Text("Itiöt")
                                    .font(.title)
                                    .bold()
                                
                                Spacer()
                                Image(systemName: "leaf.circle")
                            }//:HSTACK
                            
                            Divider()
                            Text(mushroom.spores)
                        }//:VSTACK
                    }
                    .padding()
                    
                }//:BOX
                
                if mushroom.sporangia != "null" && mushroom.sporangia != "Not found" {
                    GroupBox {
                        VStack {
                            HStack {
                                Text("Itiöemä")
                                    .font(.title)
                                    .bold()
                                
                                Spacer()
                                Image(systemName: "leaf.circle")
                            }//:HSTACK
                            
                            Divider()
                            Text(mushroom.sporangia)
                        }//:VSTACK
                    }
                    .padding()
                }
                //:BOX
                
                
                // LINK TO WEBSITES
                
                
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
