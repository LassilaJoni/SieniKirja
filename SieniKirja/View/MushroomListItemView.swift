//
//  MushroomListItemView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct MushroomListItemView: View {
    
    let mushroom: Mushroom
    
    var body: some View {
        HStack {
            Image(mushroom.image)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(mushroom.name)
                    .font(.title)
                    .fontWeight(.heavy)
                .foregroundColor(.accentColor)
            
            
            Text(mushroom.latinName)
                .font(.footnote)
                .lineLimit(2)
                .padding(.trailing)
            } //: VSTACK
        } //: HSTACK
    }
}

struct MushroomListItemView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        MushroomListItemView(mushroom: mushrooms[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
