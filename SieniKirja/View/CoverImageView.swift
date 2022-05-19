//
//  CoverImageView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    let coverImage: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImage) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //: LOOP
        } //: TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }

}


// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 350))
    }
}
