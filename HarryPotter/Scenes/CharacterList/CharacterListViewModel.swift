//
//  CharacterListViewModel.swift
//  HarryPotter
//
//  Created by Gloria Villa on 3/27/24.
//  To Do : review model diagram, questions call backs
//  Testing?

import Foundation
import Combine

// switch every assignment to main thread

class CharacterListViewModel :ObservableObject{
    enum State {
        case loading
        case empty
        case error(String)
        case success([Character])
    }
    private let charactersService = CharacterService()
    //@Published var characters:[Character] = [] //CharacterListViewModel will notify because of Observable object View will be notified by change Character, observable object some other object in this case view will reload.
    
    @Published var state: State = .loading
    func loadCharacters () {
        
        //view will ask view model, view model is calling characters service then it calls completion of view model, characters is assigned to view models characters
        charactersService.getCharacters{result in
            // move to main thread - switch threads
            // weak self means it can be removed from the memory
            DispatchQueue.main.async {[weak self] in
                // need to change State to success
                //self.characters = characters
                switch result {
                case .success(let characters):
                    if characters.isEmpty {
                        self?.state = .empty
                    } else {
                        self?.state = .success(characters)
                    }
                    
                case .failure(let error):
                    switch error {
                    case .general:
                        self?.state = .error("Something went Wrong")
                    }
                }
                
            }
            
            
            
        }
//          need to wait for response - combine (list of characters when it is changing here are your new characters) view and model
        // mock
        /*
        characters =
        [
            Character(name: "Harry Potter", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
            Character(name: "Harry Potter1", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
            Character(name: "Harry Potter2", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
            Character(name: "Harry Potter3", house: "Grifindor", wand: Wand(wood: "maple", core:"alabaster", length: 10.5), image: "https://ik.imagekit.io/hpapi/harry.jpg"),
        ]
         */
    }
}
