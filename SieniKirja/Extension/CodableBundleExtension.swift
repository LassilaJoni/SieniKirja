//
//  CodableBundleExtension.swift
//  SieniKirja
//
//  Created by Joni Lassila on 19.5.2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // Locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //  Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // Create decoder
        let decoder = JSONDecoder()
        
        // Create property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bunde")
        }
        
        return loaded
    
    }
}
