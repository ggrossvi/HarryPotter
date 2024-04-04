//
//  Character.swift
//  HarryPotter
//
//  Created by Gloria Villa on 3/8/24.
//

import Foundation
struct Character : Identifiable {
    let id: String = UUID().uuidString // random id
    let name: String
    let house: String
    let wand: Wand
    let image: String
}

