//
//  InsetDetailsView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 30.5.2022.
//

import SwiftUI

struct InsetDetailsView: View {
    
    let mushroom: Mushroom
    
    var body: some View {
        
        List {
        VStack {
            
            
            if mushroom.domeeni != "null" {
                GroupBox {
                    Text("Kaari").foregroundColor(Color.white).background(
                            Color.white
                            .frame(height: 1)
                            .offset(y: 10))
                            .font(.title)
                    Text(mushroom.domeeni)
            }
                
            }
            
            if mushroom.kaari != "null" {
                GroupBox(label: Text("Kaari").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.kaari)
                }}
            
            if mushroom.alakaari != "null" {
                GroupBox(label: Text("Alakaari").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.alakaari)
                }}
            
            if mushroom.luokka != "null" {
                GroupBox(label: Text("Luokka").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.luokka)
                }}
            
            if mushroom.alaluokka != "null" {
                GroupBox(label: Text("Alaluokka").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.alaluokka)
                }}
            
            if mushroom.lahko != "null" {
                GroupBox(label: Text("Lahko").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.lahko)
                }}
            
            if mushroom.heimo != "null" {
                GroupBox(label: Text("Heimo").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.heimo)
                }}
            
            if mushroom.suku != "null" {
                GroupBox(label: Text("Suku").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.suku)
                }}
            
            if mushroom.laji != "null" {
                GroupBox(label: Text("Laji").foregroundColor(.accentColor).background(
                    Color.accentColor
                        .frame(height: 1)
                        .offset(y: 10))) {
                    Text(mushroom.laji)
                }}
                
            }//:LIST
        .listRowBackground(Color.blue)
        }//:VSTACK
        
        
        
    }
        
}
    
struct InsetDetailsView_Previews: PreviewProvider {
    static let mushrooms: [Mushroom] = Bundle.main.decode("mushrooms.json")
    
    static var previews: some View {
        InsetDetailsView(mushroom: mushrooms[0])
        
            .previewLayout(.sizeThatFits)
            .padding()

    }
}
