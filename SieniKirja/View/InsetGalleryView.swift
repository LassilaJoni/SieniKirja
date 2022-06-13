//
//  InsetGalleryView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct InsetGalleryView: View {
    @State private var willMoveToNextScreen = false
    let mushroom: Mushroom
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
      
                HStack {
                    
                    ForEach(mushroom.gallery, id: \.self) { item in
                        NavigationLink(destination: GalleryImageView(mushroom: mushroom)) {
                            WebImage(url: URL(string: item))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                            .cornerRadius(15)
                        }
                            
                        
                            
                        
                    } //: LOOP
                    
                } //: HSTACK
                
        } //: SCROLLVIEW
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        InsetGalleryView(mushroom: mushrooms[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
