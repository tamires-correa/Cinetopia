//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Tamires Corrêa on 01/04/26.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var movieDetail : Movie
    
    init(movieDetail: Movie) {
        self.movieDetail = movieDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieTitleLabelDetailView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var moviePosterDetailView: UIImageView = {
        let poster =  UIImageView()
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.layer.cornerRadius = 16
        poster.contentMode = .scaleAspectFill
        poster.layer.masksToBounds = true
        return poster
    }()
    
    private lazy var movieRateLabelDetailView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var movieDescriptionLabelDetailView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        configureView()
        setupNavigationBar()
        view.backgroundColor = .background
    }
    
    private func addSubviews() {
        view.addSubview(moviePosterDetailView)
        view.addSubview(movieTitleLabelDetailView)
        view.addSubview(movieRateLabelDetailView)
        view.addSubview(movieDescriptionLabelDetailView)
    }
    
    func configureView(){
        moviePosterDetailView.image = UIImage(named: movieDetail.image)
        movieTitleLabelDetailView.text = movieDetail.title
        movieRateLabelDetailView.text = "Classificação dos usuários: \(movieDetail.rate)"
        movieDescriptionLabelDetailView.text = movieDetail.synopsis
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
 
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            movieTitleLabelDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
            movieTitleLabelDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieTitleLabelDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            moviePosterDetailView.topAnchor.constraint(equalTo: movieTitleLabelDetailView.bottomAnchor, constant: 20),
            moviePosterDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviePosterDetailView.widthAnchor.constraint(equalToConstant: 176.25),
            moviePosterDetailView.heightAnchor.constraint(equalToConstant: 235),
            
            movieRateLabelDetailView.topAnchor.constraint(equalTo: moviePosterDetailView.bottomAnchor, constant: 20),
            movieRateLabelDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieDescriptionLabelDetailView.topAnchor.constraint(equalTo: movieRateLabelDetailView.bottomAnchor, constant: 25),
            movieDescriptionLabelDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieDescriptionLabelDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
//            moviePosterDetailView.widthAnchor.constraint(equalToConstant: 100),
            //
            //            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            //            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            //            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //
            //            movieReleaseDataLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            //            movieReleaseDataLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16)
            //
        ])
    }
}
#Preview {
    MovieDetailsViewController(movieDetail: movies[2])
}
