//
//  Favorites.swift
//  SieniKirja
//
//  Created by Joni Lassila on 20.5.2022.
//

import Foundation

class Favorites: ObservableObject {
    let defaults = UserDefaults.standard
    public var mushrooms: Set<String>
    
    init() {
        let decoder = JSONDecoder()
                if let data = defaults.data(forKey: "Favorites") {
                    let mushroomData = try? decoder.decode(Set<String>.self, from: data)
                    self.mushrooms = mushroomData ?? []
                } else {
                    self.mushrooms = []
                }
        
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
        let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(mushrooms)  {
               defaults.set(encoded, forKey: "Favorites")
           }
    }
    
}
