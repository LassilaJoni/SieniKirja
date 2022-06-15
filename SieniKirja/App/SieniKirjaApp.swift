//
//  SieniKirjaApp.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

@main
struct SieniKirjaApp: App {
    @AppStorage("FirstStart") var didLaunchBefore: Bool = true
    var body: some Scene {
        
        
        WindowGroup {

                 ContentView()
             
           }
    }
}
