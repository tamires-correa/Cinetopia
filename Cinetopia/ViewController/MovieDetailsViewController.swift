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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        title = movieDetail.title

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
