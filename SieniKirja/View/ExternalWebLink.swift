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
                Image(systemName: "network")
                Text("Wikipedia.fi")
                Spacer()
                
                Group {
                    Image(systemName: "link")
                    Link(mushroom.name, destination: (URL(string: mushroom.link) ?? URL(string: "https://wikipedia.org"))!)
                    
                }//:GROUP
                .foregroundColor(.accentColor)
            }//:HSTACK
            
        
            
        } //:BOX
        GroupBox {
            HStack {
                Image(systemName: "network")
                Text("Laji.fi")
                Spacer()
                Group {
                    Image(systemName: "link")
                    Link(mushroom.name, destination: (URL(string: mushroom.extraLink) ?? URL(string: "https://laji.fi"))!)
                }//:GROUP
                .foregroundColor(.accentColor)
        } //:HSTACK
        }//:BOX
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        ExternalWebLink(mushroom: mushrooms[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
