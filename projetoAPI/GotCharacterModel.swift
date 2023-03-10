//
//  GotCharacterModel.swift
//  projetoAPI
//
//  Created by Arthur Soares on 09/03/23.
//

import Foundation

struct gotCharacter: Decodable, Identifiable, Encodable {
    let id: Int
    let fullName: String
    let family: String
    let imageUrl: String
}
