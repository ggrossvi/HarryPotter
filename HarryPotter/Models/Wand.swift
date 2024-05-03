//
//  Wand.swift
//  HarryPotter
//
//  Created by Gloria Villa on 3/8/24.
//

import Foundation
// In order to convert/decode json into Character and Wand objects, we need Wand and Character models to conform Decodable. 
struct Wand: Decodable {
    let wood: String
    let core: String
    let length: Double?
    
}
