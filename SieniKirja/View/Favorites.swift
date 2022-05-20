//
//  Favorites.swift
//  SieniKirja
//
//  Created by Joni Lassila on 20.5.2022.
//

import Foundation

class Favorites: ObservableObject {
    public var mushrooms: Set<String>
    public let saveKey = "Favorites"
    
    init() {
        mushrooms = []
        
    }
    
    func contains(_ mushroom: Mushroom) -> Bool {
        mushrooms.contains(mushroom.id)
    }
    
    func add (_ mushroom: Mushroom) {
        objectWillChange.send()
        mushrooms.insert(mushroom.id)
        save()
    }
    
    func remove(_ mushroom: Mushroom) {
        objectWillChange.send()
        mushrooms.remove(mushroom.id)
        save()
    }
    
    func save() {
        
    }
    
}
