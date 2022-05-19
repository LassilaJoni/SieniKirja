//
//  ContentView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
                                                   
    var body: some View {
        
        let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
        //MARK: - BODY
        
        NavigationView {
            List {
                CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(mushrooms) { mushroom in
                    NavigationLink(destination: MushroomDetailView(mushroom: mushroom)) {
                        MushroomListItemView(mushroom: mushroom)
                    }
                    
                }
            }//: LIST
            .navigationBarTitle("Sienikirja", displayMode: .large)
            
        } //: NAVIGATION
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
