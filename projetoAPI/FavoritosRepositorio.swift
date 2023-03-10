//
//  FavoritosRepositorio.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import Foundation

class FavoritosRepositorio: ObservableObject {
    @Published var favoritos = [gotCharacter]() {
        didSet {
            // Salva os favoritos no UserDefaults sempre que houver uma alteração
            let favoritosData = try? JSONEncoder().encode(favoritos)
            UserDefaults.standard.set(favoritosData, forKey: "favoritos")
        }
    }
    
    init() {
        // Carrega os favoritos do UserDefaults ao inicializar a classe
        if let favoritosData = UserDefaults.standard.data(forKey: "favoritos"),
           let favoritos = try? JSONDecoder().decode([gotCharacter].self, from: favoritosData) {
            self.favoritos = favoritos
        }
    }
    
    func addFavorites(gc: gotCharacter){
        favoritos.append(gc)
    }
    
    func removeFavorite(gc: gotCharacter) {
        guard let index = favoritos.firstIndex(where: {$0.id == gc.id}) else {
            return
        }
        favoritos.remove(at: index)
    }
    
    func isFavorite(gc:gotCharacter) -> Bool {
        return (favoritos.firstIndex(where: {$0.id == gc.id}) != nil)
    }
    
}
