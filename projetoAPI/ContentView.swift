//
//  ContentView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var favoritosRepo: FavoritosRepositorio
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Personagens", systemImage: "person")
                }
            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "star.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FavoritosRepositorio())
    }
}


