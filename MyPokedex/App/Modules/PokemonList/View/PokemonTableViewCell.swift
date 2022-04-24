//
//  PokemonTableViewCell.swift
//  MyPokedex
//
//  Created by Agustin Russo on 20/04/2022.
//

import UIKit


// CONTENTVIEW: Contenedor del tableviewcell donde viven todos los controles visuales
class PokemonTableViewCell: UITableViewCell {

    var name: String? {
        didSet {
            pokemonName.text = name
        }
    }
    
    private lazy var placehoderImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .lightGray
        aImage.image = UIImage(named: "pokeball")
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray
        return aLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(placehoderImage)
        contentView.addSubview(pokemonName)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            // Image constraints
            
            placehoderImage.heightAnchor.constraint(equalToConstant: 60),
            placehoderImage.widthAnchor.constraint(equalToConstant: 60),
            
            placehoderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placehoderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            placehoderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            
            pokemonName.leadingAnchor.constraint(equalTo: placehoderImage.trailingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonName.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
