//
//  MushroomModel.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import SwiftUI

struct Mushroom: Codable, Identifiable {
    let id: String
    let name: String
    let latinName: String
    let description: String
    let link: String
    let image: String
    let edible: String
    let gallery: [String]
}
