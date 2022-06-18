//
//  GalleryImageView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 3.6.2022.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct GalleryImageView: View {
    let mushroom: Mushroom
   
    
    
    var body: some View {
            
                    TabView {
                    ForEach(mushroom.gallery, id: \.self) { item in
                            WebImage(url: URL(string: item))
                            .resizable()
                            .indicator(.activity)
                            .aspectRatio(contentMode: .fit)
                            .pinchToZoom()
                            
                    } //: LOOP
                       
                } //: TABVIEW
    
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
                    .navigationBarTitleDisplayMode(.inline)
                           .toolbar {
                               ToolbarItem(placement: .principal) {
                                   VStack {
                                       
                                       Text(mushroom.name).font(.headline)
                                           
                                       Text(mushroom.latinName).font(.subheadline)
                                   }
                                   .foregroundColor(.accentColor)
                               }
                           }
    
        
        if mushroom.credit != "" {
            Text("Kuvan © " + mushroom.credit)
        }
    }
}



struct GalleryImageView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    static var previews: some View {
        Group {
            GalleryImageView(mushroom: mushrooms[0])
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
        }
    }
}
