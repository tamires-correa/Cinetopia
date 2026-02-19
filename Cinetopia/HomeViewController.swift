//
//  ViewController.swift
//  Cinetopia
//
//  Created by Tamires Corrêa on 28/01/26.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(image: UIImage.logo)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let coupleImage = UIImageView(image: UIImage.couple)
        coupleImage.translatesAutoresizingMaskIntoConstraints = false
        return coupleImage
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .accent
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        return welcomeLabel
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar!", for: .normal)
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .buttonBackground
        button.layer.cornerRadius = 32
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(coupleImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coupleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            coupleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: coupleImageView.bottomAnchor, constant: 32),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            welcomeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            welcomeButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
   

}

