//
//  DetailsViewController.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var movie: Movie!
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.style = .large
        spinner.startAnimating()
        return spinner
    }()
    
    private lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.loadImage(url: movie.title.image.url) { self.spinner.stopAnimating() }
        image.clipsToBounds = true
        image.width(UIScreen.main.bounds.width * 0.6)
        image.height(UIScreen.main.bounds.height * 0.5)
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.width(UIScreen.main.bounds.width - 40)
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = movie.title.title
        return label
    }()
    
    private lazy var plotOutlineLabel: UILabel = {
        let label = UILabel()
        label.width(UIScreen.main.bounds.width - 40)
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text = movie.plotOutline.text
        return label
    }()
    
    private var datasheetLabel: UILabel = {
        let label = UILabel()
        label.text = "Ficha Técnica"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.width(UIScreen.main.bounds.width - 40)
        label.customLabel(label: "Gênero", value: label.genreFormatter(array: movie.genres))
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Duração", value: label.timeFormatter(time: movie.title.runningTimeInMinutes ?? 0))
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Lançamento", value: label.convertDate(string: movie.releaseDate))
        return label
    }()
    
    private lazy var popularityLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Popularidade", value: (movie.ratings.canRate ? "\(movie.ratings.rating!)" : ""))
        return label
    }()
    
    init(movie: Movie){
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBlack
        navigationController?.configure(title: "")
        
        configureView()
    }
    
    private func configureView() {
        view.addSubview(scrollView)
        scrollView.addSubview(spinner)
        scrollView.addSubview(posterImage)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(plotOutlineLabel)
        scrollView.addSubview(datasheetLabel)
        scrollView.addSubview(genresLabel)
        scrollView.addSubview(durationLabel)
        scrollView.addSubview(releaseDateLabel)
        scrollView.addSubview(popularityLabel)
        
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftToSuperview()
        scrollView.rightToSuperview()
        scrollView.bottomToSuperview()
        
        posterImage.centerXToSuperview()
        posterImage.topToSuperview(offset: 40)
        
        spinner.centerX(to: posterImage)
        spinner.centerY(to: posterImage)
        
        nameLabel.topToBottom(of: posterImage, offset: 20)
        nameLabel.centerXToSuperview()
        
        plotOutlineLabel.topToBottom(of: nameLabel, offset: 20)
        plotOutlineLabel.centerXToSuperview()
        
        datasheetLabel.topToBottom(of: plotOutlineLabel, offset: 30)
        datasheetLabel.leftToSuperview(offset: 20)
        
        genresLabel.topToBottom(of: datasheetLabel, offset: 20)
        genresLabel.leftToSuperview(offset: 20)
        
        durationLabel.topToBottom(of: genresLabel, offset: 10)
        durationLabel.leftToSuperview(offset: 20)
        
        releaseDateLabel.topToBottom(of: durationLabel, offset: 10)
        releaseDateLabel.leftToSuperview(offset: 20)
        
        popularityLabel.topToBottom(of: releaseDateLabel, offset: 10)
        popularityLabel.leftToSuperview(offset: 20)
        popularityLabel.bottomToSuperview(offset: -30)
    }
}


private extension UILabel{
    
    func convertDate(string: String) -> String {
        var array = string.components(separatedBy: "-")
        array = array.reversed()
        let formattedDate = array.joined(separator: "/")
        
        return formattedDate
    }
    
    func customLabel(label: String, value: String) {
        
        self.textColor = .lightGray
        self.font = .systemFont(ofSize: 20)
        
        let string = "\(label): \(value)"
        let attributedText = NSMutableAttributedString(string: string)
        attributedText.addAttribute(.font,
                                    value: UIFont.boldSystemFont(ofSize: 18),
                                    range: NSRange(location: 0, length: label.count))
        
        self.attributedText = attributedText
    }
    
    
    func timeFormatter(time: Int) -> String {
        let time = time
        var formattedTime: String
        
        if time >= 60 {
            let hour = time / 60
            let minutes = time % 60
            formattedTime = "\(hour)h \(minutes)m"
            
            return formattedTime
            
        } else {
            formattedTime = "\(time)m"
            
            return formattedTime
        }
    }
    
    func genreFormatter(array: [String]) -> String{

        var genreList: [String] = []

        for genre in array {
            genreList.append(genre)
        }

        let returnString = genreList.joined(separator: ", ")

        return returnString
    }
}
