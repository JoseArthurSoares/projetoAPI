//
//  FavoritesView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritosRepo: FavoritosRepositorio
    
    
    var body: some View {
        NavigationView{
            List(favoritosRepo.favoritos) { favorito in
                BasicRowView (image: favorito.imageUrl, nome: favorito.fullName, isFavorite: favoritosRepo.isFavorite(gc: favorito))
            }
            .navigationTitle("Favoritos")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(FavoritosRepositorio())
    }
}
