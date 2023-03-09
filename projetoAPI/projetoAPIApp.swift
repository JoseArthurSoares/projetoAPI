//
//  projetoAPIApp.swift
//  projetoAPI
//
//  Created by Arthur Soares on 08/03/23.
//

import SwiftUI

@main
struct projetoAPIApp: App {
    var favoritosRepo = FavoritosRepositorio()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritosRepo)
        }
    }
}
