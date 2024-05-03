//
//  CharacterListView.swift
//  HarryPotter
//
//  Created by Gloria Villa on 3/8/24.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel //@Observed property wrapper
    //Rules of Observing View Model changes from View
    //1)class view model - view model must be child of ObservableObject for example CharacterListViewModel :ObservableObject
    //2) viewModel property declared as @Published(property wrapper) in this case characters for example @Published var characters:[Character]
    //3) instance of the viewModel in the View must be declared as @ObservedObject for example  @ObservedObject var viewModel
    var body: some View {
        VStack{
            switch viewModel.state{
            case .loading:
                ProgressView()
            case .success(let characters):
                List(characters) { character in
                    HStack{
                        // character image is url so it's a string. Async Image has a constructor that requires URL
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 96, height: 96)
                        VStack (alignment: .leading){
                            /*@START_MENU_TOKEN@*/Text(character.name)/*@END_MENU_TOKEN@*/
                            Text(character.house)
                            Text(character.wand.wood)
                            Text(character.wand.core)
                            //Text(character.wand.length)
                            // if length exists
                            if let length = character.wand.length{
                                // stringifies the expression
                                Text("\(length)")
                            }
                        }
                    }
                    
                }
            case .empty:
                Text("No Characters Found")
            default: EmptyView()
            }
        }
        .onAppear {
            viewModel.loadCharacters()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterListViewModel())
    }
}
