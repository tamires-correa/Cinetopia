//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Tamires Corrêa on 22/02/26.
//

import UIKit

class MoviesViewController: UIViewController{
    
    var filteredMovies : [Movie] = []
    var isSearchActive : Bool = false
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    private lazy var searchBar:  UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString (string: "Pesquisar...", attributes: [.foregroundColor: UIColor.lightGray])
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.delegate = self
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
            ]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
          
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Filmes Populares", style: .plain, target: nil, action: nil)
        navigationItem.titleView = searchBar
    }
    
    
    private func addSubviews(){
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
