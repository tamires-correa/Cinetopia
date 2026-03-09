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
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let coupleImage = UIImageView(image: UIImage.couple)
        coupleImage.translatesAutoresizingMaskIntoConstraints = false
        coupleImage.contentMode = .scaleAspectFit
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
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView, coupleImageView, welcomeLabel, welcomeButton])
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    @objc private func buttonPressed() {
        navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            
            welcomeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            welcomeButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
