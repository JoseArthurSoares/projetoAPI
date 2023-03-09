//
//  ContentView-ViewModel.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import Foundation

extension ListView {
    @MainActor class ViewModel: ObservableObject {
        @Published var characters = [gotCharacter]()

        func fetchCharacters() async {
            guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else {
                print("Não funcionou")
                return
            }

            do {
                let(data, _) = try await URLSession.shared.data(from: url)
                if let decoded = try? JSONDecoder().decode([gotCharacter].self, from: data) {
                    characters = decoded
                }
            } catch {
                print("Erro")
            }
        }
    }
}
