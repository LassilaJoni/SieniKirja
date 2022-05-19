//
//  ExternalWebLink.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct ExternalWebLink: View {
    let mushroom: Mushroom
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(mushroom.name, destination: (URL(string: mushroom.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        
            
        } //:BOX
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        ExternalWebLink(mushroom: mushrooms[0])
    }
}
