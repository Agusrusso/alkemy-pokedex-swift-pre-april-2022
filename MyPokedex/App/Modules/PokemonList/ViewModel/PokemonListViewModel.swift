//
//  PokemonListViewModel.swift
//  MyPokedex
//
//  Created by Jesus Nieves on 23/04/2022.
//

import Foundation

class PokemonListViewModel {
    
    private var service: PokemonListService
    private var delegate: PokemonListDelegate
    private var pokemons =  [Pokemon]()
    
    init (service: PokemonListService, delegate: PokemonListDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    // Con closure
    // func getPokemons(onSucces: ()-> Void, onEror: ()-> Void) {
    // Con delegates
    func getPokemons() {
        self.delegate.toogleLoading()
        service.getPokemons { pokemons in
            self.pokemons = pokemons
            
            // con closure
            // onSucces()
            // Con delegates
            self.delegate.reloadTable()
            self.delegate.toogleLoading()
        } onError: {
            // con closures
            // onEror()
            // con delegate
            self.delegate.showError()
            self.delegate.toogleLoading()
        }
    }
    
    func getPokemon(at index: Int) -> Pokemon {
        return pokemons[index]
    }
    
    func getPokemonCount () -> Int {
        return pokemons.count
    }

}
