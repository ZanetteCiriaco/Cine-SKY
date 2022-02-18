//
//  HomeViewController.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 15/02/22.
//

import UIKit
import TinyConstraints

class HomeViewController: UIViewController {
    
    let provider = MoviesProvider()
    var movies: [Movie] = []
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.center =  self.view.center
        spinner.style = .large
        spinner.startAnimating()
        return spinner
    }()
    
    private lazy var moviesCollection: UICollectionView = {
        let width = (UIScreen.main.bounds.width - 60)/2
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: width, height: UIScreen.main.bounds.height * 0.38)
        
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = .customBlack
        collection.showsVerticalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseIdentifier)
        
        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CartHeaderCollectionReusableView")
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configure(title: "Cine SKY")
        navigationItem.title = "Cine SKY"
        navigationItem.backButtonTitle = ""
        
        view.backgroundColor = .customBlack
        view.addSubview(spinner)
        
        provider.getMostPopularMoviesId { res in
            self.movies = res
            self.spinner.stopAnimating()
            self.configureView()
        }
    }
    
    private func configureView() {
        view.addSubview(moviesCollection)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        moviesCollection.rightToSuperview(offset: -20)
        moviesCollection.leftToSuperview(offset: 20)
        moviesCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        moviesCollection.bottomToSuperview(offset: -10)
    }
    
    private func setupAcitivityIndicator() {
        
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollection.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseIdentifier, for: indexPath) as! MoviesCollectionViewCell
        
        cell.movie = self.movies[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        self.navigationController?.pushViewController(DetailsViewController(movie: movie), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CartHeaderCollectionReusableView", for: indexPath)
        
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Uma seleção de filmes imperdíveis:"
        
        headerView.addSubview(label)
        
        label.leftToSuperview()
        label.centerYToSuperview()
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
    }
    
    
}


