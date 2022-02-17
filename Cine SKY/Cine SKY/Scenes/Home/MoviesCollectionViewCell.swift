//
//  MoviesCollectionViewCell.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 15/02/22.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "moviesCollectionCell"
    
    var movie: Movie? {
        didSet {
            setValues()
        }
    }
    
    private var posterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(posterImage)
        contentView.addSubview(nameLabel)
        
       
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        posterImage.topToSuperview()
        posterImage.leftToSuperview()
        posterImage.rightToSuperview()
        
        nameLabel.bottomToSuperview(offset: -10)
        nameLabel.topToBottom(of: posterImage, offset: 10)
    }
    
    private func setValues() {
        
        let url = movie?.title.image.url
        
//        "https://m.media-amazon.com/images/M/MV5BOTI4NDhhNGEtZjQxZC00ZTRmLThmZTctOGJmY2ZlOTc0ZGY0XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"
//
        posterImage.loadImage(url: url ?? "") {}
        
        nameLabel.text = movie?.title.title ?? ""
        
    }
    
    
    
}
