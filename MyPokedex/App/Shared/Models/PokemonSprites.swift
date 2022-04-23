//
//  PokemonSprits.swift
//  MyPokedex
//
//  Created by Jesus Nieves on 23/04/2022.
//

import Foundation

struct Sprite: Codable {
    let other: SpriteOther?
}

struct SpriteOther: Codable {
    let home: SpriteHome?
}

struct SpriteHome: Codable {
    let frontDefault: String?
}
