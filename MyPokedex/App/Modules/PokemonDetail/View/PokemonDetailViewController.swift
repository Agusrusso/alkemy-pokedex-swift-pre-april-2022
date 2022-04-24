//
//  PokemonDetailViewController.swift
//  MyPokedex
//
//  Created by Agustin Russo on 20/04/2022.
//

import UIKit

protocol PokemonDetailDelegate {
    func showLoading()
    func hideLoading()
    func pokemonData(pokemon: PokemonDetail)
    func showError()
}

class PokemonDetailViewController: UIViewController {

    var pokemonUrl: String = ""
    
    private var imagen: String? {
        didSet {
            if let url = URL(string: imagen ?? "") {
                pokemonImage.load(url: url)
            }
        }
    }
    
    private var name: String? {
        didSet {
            pokemonName.text = name?.uppercased()
        }
    }
    
    private var service = PokemonDetailService()
    private var viewModel:PokemonDetailViewModel?

    private lazy var pokemonBackground: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 70
        aView.backgroundColor = .white.withAlphaComponent(0.4)
        return aView
    }()
    
    private lazy var backgroudImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "pokedex")
        aImage.contentMode = .scaleAspectFill
        return aImage
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 40)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = PokemonDetailViewModel(pokemonUrl: pokemonUrl, service: service, delegate: self)
        self.viewModel?.getPokemon()
    }
    
    private func setupView(){
        view.addSubview(backgroudImage)
        view.addSubview(pokemonBackground)
        view.addSubview(pokemonImage)
        view.addSubview(pokemonName)

    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backgroudImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroudImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroudImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroudImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 200),
            pokemonImage.widthAnchor.constraint(equalToConstant: 200),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 22),
            
            pokemonBackground.heightAnchor.constraint(equalToConstant: 200),
            pokemonBackground.widthAnchor.constraint(equalToConstant: 200),
            pokemonBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
        ])
    }

}


extension PokemonDetailViewController: PokemonDetailDelegate {
    
    func showLoading() {

        
    }
    
    func hideLoading() {

    }
    
    func pokemonData(pokemon: PokemonDetail) {
        name = pokemon.name
        imagen = pokemon.sprites.other?.home?.frontDefault
    }
    
    func showError() {
        print("uff se rompio todo")
    }
    
}
