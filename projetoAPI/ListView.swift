//
//  HomeView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import SwiftUI

struct ListView: View {
    @StateObject var vm = ViewModel()
    @EnvironmentObject var favoritosRepo: FavoritosRepositorio
    
    var body: some View {
        NavigationView {
                List(vm.characters) { character in
                    NavigationLink(destination: DetailView(imagem: character.imageUrl, nome: character.fullName, familia: character.family)){
                        BasicRowView(image: character.imageUrl, nome: character.fullName)
                            .contextMenu {
                                Button(action: {
                                    favoritosRepo.addFavorites(gc: character)
                                }, label: {
                                    HStack {
                                        Text("Favorito")
                                        Spacer()
                                        Image(systemName: "star")
                                    }
                                })
                            }
                    }
                }
                .navigationTitle("Personagens")
            }
        .task {
            await vm.fetchCharacters()
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(FavoritosRepositorio())
    }
}
