//
//  DetailView.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import SwiftUI

struct DetailView: View {
    var imagem: String
    var nome: String
    var familia:String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imagem), content: { AsyncImagem in
                AsyncImagem
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                ProgressView()
            })
            Text(nome)
                .font(.title)
                .fontWeight(.black)
            Text(familia)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imagem: "", nome: "", familia: "")
    }
}
