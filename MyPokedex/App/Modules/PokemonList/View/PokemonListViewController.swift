//
//  PokemonListViewController.swift
//  MyPokedex
//
//  Created by Jesus Nieves on 20/04/2022.
//

import UIKit

protocol PokemonListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}

// PureLayout
// SnapKit
// VIEW: Contenedor del viewcontroller donde viven todos los controles visuales
class PokemonListViewController: UIViewController {

    private var service = PokemonListService()
    private var viewModel: PokemonListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
        setupConstraints()
        self.viewModel = PokemonListViewModel(service: service, delegate: self)
        // Con closures
//        self.viewModel?.getPokemons(onSucces: {
//            self.tableView.reloadData()
//        }, onEror: {
//            print(errr)
//        })
        
        // Con delegates
        self.viewModel?.getPokemons()
    }
    
    private func setupView(){
        // Agregamos el tableview al viewcontroller
        view.addSubview(tableView)
        title = "Lista de pokemones"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: String(describing: PokemonTableViewCell.self))
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension PokemonListViewController: PokemonListDelegate {
    
    func toogleLoading() {
        print("aca deberia estar cargando o NO")
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showError() {
        print("LPM se rompio todo")
    }
    
}


extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = PokemonDetailViewController()
        let pokemon = viewModel?.getPokemon(at: indexPath.row)
        detailViewController.pokemonUrl = pokemon?.url ?? ""
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonTableViewCell.self), for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        
        let pokemon = viewModel?.getPokemon(at: indexPath.row)
        cell.name = pokemon?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getPokemonCount() ?? 0
    }
    
}
