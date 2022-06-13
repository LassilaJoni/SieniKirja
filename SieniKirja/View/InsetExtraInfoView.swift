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

        Group {
            HStack {
                TabView {
                    if !mushroom.spreadiness.contains("Not found") {
                            GroupBox(label: Text("Levinneisyys")) {
                                Text(mushroom.spreadiness)
                            }}
                    if !mushroom.environment.contains("Not found") {
                            GroupBox(label: Text("Elinympäristö")) {
                                Text(mushroom.environment)
                            }}
                            GroupBox(label: Text("Havainnot Suomessa")) {
                                Text("Suomessa yhteensä " + String(mushroom.observationCount) + " havaintoa")
                        }
                          
                            }//:TAB

                    .tabViewStyle(PageTabViewStyle())
                    .frame(minWidth: 150, idealWidth: 200, maxWidth: 600, minHeight: 150, idealHeight: 165, maxHeight: 100, alignment: .top)
            }
        }
        
        }
    }

struct InsetExtraInfoView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        InsetExtraInfoView(mushroom: mushrooms[0])
            .previewLayout(.sizeThatFits)
            .padding()

    }
}
