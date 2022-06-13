//
//  GalleryViewModel.swift
//  SieniKirja
//
//  Created by Joni Lassila on 3.6.2022.
//

import SwiftUI

class GalleryViewModel: ObservableObject {
    
    
    @Published var selectedImages : [String] = []
    
    @Published var selectedImageID: String = ""
}
