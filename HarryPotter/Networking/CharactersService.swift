//
//  CharactersService.swift
//  HarryPotter
//
//  Created by Gloria Villa on 4/4/24.
//

import Foundation
import Combine
class CharacterService {
    enum ServiceError: Error {
        case general
    }
    var cancellable: AnyCancellable?
    
    func getCharacters(completion: @escaping (Result<[Character],ServiceError>)->Void){
        let url = URL(string: "https://hp-api.onrender.com/api/characters")! // forcing optional to exist - but you expect string to exist; sending request to this url returns json
        let request = URLRequest(url: url) //creating request
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)  // preparing to send request ; dataTaskPublisher is sending request
            // sink 2 call backs 1)recieve completion nofities when a. request failed b. request finished but not necessarily succeeded. 2) callback(function) recievedValue a. successful and have the data to decode into object
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    ()
                case .failure:
                    completion(.failure(.general))
                }
                
            }, receiveValue: { data, _ in
                // if successful decoded prints - json decode to object (array of Characters)
                //mock failure
                //completion(.failure(.general))
                //return
                if let characters = try? JSONDecoder().decode([Character].self, from: data) {
                    completion(.success(characters))
                    //print(characters)
                } else {
                    completion(.failure(.general))
                }
            })
         
    }
}
