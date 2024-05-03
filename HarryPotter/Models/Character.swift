//
//  Character.swift
//  HarryPotter
//
//  Created by Gloria Villa on 3/8/24.
//

import Foundation
// Decodable forces each property to be decodable String by default is decodable, but wand is not
// In order to convert/decode json into Character and Wand objects, we need Wand and Character models to conform Decodable.
struct Character : Identifiable, Decodable {
    let id: String // random id comes from server
    let name: String
    let house: String
    let wand: Wand
    let image: String
}

