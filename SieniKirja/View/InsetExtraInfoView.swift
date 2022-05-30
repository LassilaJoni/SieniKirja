//
//  InsetExtraInfoView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 30.5.2022.
//

import SwiftUI

struct InsetExtraInfoView: View {
    
    let mushroom: Mushroom
    
    var body: some View {


            TabView {
                    GroupBox(label: Text("Levinneisyys")) {
                        Text(mushroom.spreadiness)
                        }
                    GroupBox(label: Text("Elinympäristö")) {
                        Text(mushroom.environment)
                        }
                    GroupBox(label: Text("Havainnot Suomessa")) {
                        Text("Suomessa yhteensä " + String(mushroom.observationCount) + " havaintoa")
                        }
                  
                    }//:TAB

            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 226, idealHeight: 168, maxHeight: 200)
        }
    }

struct InsetExtraInfoView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        InsetExtraInfoView(mushroom: mushrooms[0])
            .previewLayout(.sizeThatFits)
            //.padding()

    }
}
