//
//  MushroomEdibleView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI


struct MushroomEdibleView: View {
    
    
    
    var edibleImage: String
    var edibleText: String
    
    let mushroom: Mushroom
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(systemName: edibleImage)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .foregroundColor(.red)
            /* Make in the json for every poisonous mushroom some kind of text
             If it's poisonous place a warning symbol
             exclamationmark.circle.fill
            if((mushroom.edible).contains("myrkyllinen")) {
                Text("Joo")
            } else {
                Text("jaaha")
            }
             */
            Text(mushroom.edible)
                .font(.title3)
                .fontWeight(.bold)
             
        } //: HSTACK
        .padding(.vertical)
    }
}

struct MushroomEdibleView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        MushroomEdibleView(edibleImage: "exclamationmark.circle", edibleText: "edible", mushroom: mushrooms[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
