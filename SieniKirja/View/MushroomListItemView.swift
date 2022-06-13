//
//  MushroomListItemView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MushroomListItemView: View {
    
    let mushroom: Mushroom
    
    var body: some View {
        
        HStack {
                WebImage(url: URL(string: mushroom.image))
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                
            
            VStack(alignment: .leading, spacing: 5) {
                Text(mushroom.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                .foregroundColor(.accentColor)
            
            
            Text(mushroom.latinName)
                .font(.footnote)
                .lineLimit(2)
                .padding(.trailing, 8)
            } //: VSTACK
        } //: HSTACK
      
    }
}

struct MushroomListItemView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        MushroomListItemView(mushroom: mushrooms[1])
            .previewLayout(.sizeThatFits)
            
    }
}
