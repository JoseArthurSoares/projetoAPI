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
    @State var isPressedConfig = false

    var body: some View {
        NavigationView {
                List(vm.characters) { character in
                    NavigationLink(destination: DetailView(imagem: character.imageUrl, nome: character.fullName, familia: character.family)){
                        BasicRowView(image: character.imageUrl, nome: character.fullName, isFavorite: favoritosRepo.isFavorite(gc: character))
                            .contextMenu {
                                Button(action: {
                                    if favoritosRepo.isFavorite(gc: character) {
                                        favoritosRepo.removeFavorite(gc: character)
                                    } else {
                                        favoritosRepo.addFavorites(gc: character)
                                    }
                                }, label: {
                                    if favoritosRepo.isFavorite(gc: character) {
                                        HStack {
                                            Text("Desafavoritar")
                                            Spacer()
                                            Image(systemName: "star.slash.fill")
                                        }
                                    } else {
                                        HStack {
                                            Text("Favoritar")
                                            Spacer()
                                            Image(systemName: "star.fill")
                                        }
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
