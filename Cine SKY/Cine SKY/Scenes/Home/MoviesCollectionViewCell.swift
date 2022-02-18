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
    
    private lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.height(self.contentView.bounds.height * 0.80)
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.sizeToFit()
        label.width(self.contentView.bounds.width)
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
        
        nameLabel.topToBottom(of: posterImage, offset: 10)
    }
    
    private func setValues() {
        
        let url = movie?.title.image.url
    
        posterImage.loadImage(url: url ?? "") {}
        
        nameLabel.text = movie?.title.title ?? ""
        
    }
    
    
    
}
