//
//  SerringsView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import SwiftUI

struct SettingsView: View {
    @State var preferencias = ["Ordem alfabética", "Favoritos primeiro"]
    @State var ordemSelecionada = ""
    @State var showAlert = false
    @EnvironmentObject var favoritosRepo: FavoritosRepositorio
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("preferência de ordenação")) {
                        Picker(selection: $ordemSelecionada, label: Text("Ordenar por:")) {
                            ForEach(preferencias, id: \.self) { preferencia in
                                Text(preferencia)
                            }
                        }
                    }
                }
                .navigationTitle("Configurações")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Text("Apagar todos os favoritos")
                                .fontWeight(.bold)
                                .padding()
                                .background(Color(.systemRed))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        })
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Aviso"), message: Text("Tem certeza que deseja apagar todos os favoritos?"), primaryButton: .destructive(Text("Sim"), action: {
                    favoritosRepo.favoritos.removeAll()
                    })
                    ,secondaryButton: .cancel(Text("Não")))
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(FavoritosRepositorio())
    }
}
