//
//  CharacterListViewModel.swift
//  HarryPotter
//
//  Created by Gloria Villa on 3/27/24.
//

import Foundation
import Combine

class CharacterListViewModel :ObservableObject{
    @Published var characters:[Character] = [] //CharacterListViewModel will notify because of Observable object View will be notified by change Character, observable object some other object in this case view will reload.
    func loadCharacters () {
//          need to wait for response - combine (list of characters when it is changing here are your new characters) view and model
        // mock
        characters =
        [
            Character(name: "Harry Potter", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
            Character(name: "Harry Potter1", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
            Character(name: "Harry Potter2", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
            Character(name: "Harry Potter3", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
        ]
    }
}
