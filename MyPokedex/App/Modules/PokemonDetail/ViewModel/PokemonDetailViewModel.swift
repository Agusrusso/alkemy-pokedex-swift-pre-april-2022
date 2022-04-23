//
//  PokemonDetailViewModel.swift
//  MyPokedex
//
//  Created by Jesus Nieves on 23/04/2022.
//

import Foundation

class PokemonDetailViewModel {

    private var delegate: PokemonDetailDelegate
    private var service: PokemonDetailService
    private var pokemonUrl: String
    
    init(pokemonUrl: String, service: PokemonDetailService, delegate: PokemonDetailDelegate) {
        self.pokemonUrl = pokemonUrl
        self.service = service
        self.delegate = delegate
    }
    
    func getPokemon(){
        self.delegate.showLoading()
        service.getPokemon(urlPokemon: pokemonUrl) { pokemon in
            self.delegate.pokemonData(pokemon: pokemon)
            self.delegate.hideLoading()
        } onError: {
            self.delegate.hideLoading()
            self.delegate.showError()
        }

    }
}
