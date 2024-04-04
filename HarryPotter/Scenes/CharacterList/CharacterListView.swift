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
        List(viewModel.characters) { character in
            /*@START_MENU_TOKEN@*/Text(character.name)/*@END_MENU_TOKEN@*/
        }.onAppear {
            viewModel.loadCharacters()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterListViewModel())
    }
}
