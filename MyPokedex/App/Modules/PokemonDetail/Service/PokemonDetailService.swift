//
//  PokemonDetailService.swift
//  MyPokedex
//
//  Created by Jesus Nieves on 23/04/2022.
//

import Foundation

class PokemonDetailService {

    func getPokemon(urlPokemon: String, onComplete: @escaping (PokemonDetail) -> Void, onError: @escaping () -> Void) {

        ApiManager.shared.get(url: urlPokemon) { response in

        switch response {
        case .success(let data):
           do {
               if let data = data {
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                   let pokemonDetail = try decoder.decode(PokemonDetail.self, from: data)
                   onComplete(pokemonDetail)
               } else {
                   onError()
               }
           } catch {
               onError()
           }
        case .failure(_):
           onError()
        }
    }
 }
}
