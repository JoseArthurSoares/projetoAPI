//
//  ContentView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var favoritosRepo: FavoritosRepositorio
    @State var isGearPressed = false
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
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isGearPressed = true
                    }, label: {
                        Image(systemName: "gear")
                            .font(.title)
                    })
                }
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $isGearPressed) {
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FavoritosRepositorio())
    }
}


