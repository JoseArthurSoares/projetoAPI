//
//  BasicRowView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import SwiftUI

struct BasicRowView: View {
    var image: String
    var nome: String
    var isFavorite: Bool
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image), content: { imagem in
                imagem
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(5)
            }, placeholder: {
                ProgressView()
            })
            
            Text(nome)
            
            Spacer()
            
            if isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct BasicRowView_Previews: PreviewProvider {
    static var previews: some View {
        BasicRowView(image: "", nome: "", isFavorite: false)
    }
}
