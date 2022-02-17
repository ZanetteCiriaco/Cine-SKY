//
//  DetailsViewController.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var posterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.loadImage(url: "https://m.media-amazon.com/images/M/MV5BOTI4NDhhNGEtZjQxZC00ZTRmLThmZTctOGJmY2ZlOTc0ZGY0XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg") {}
        image.clipsToBounds = true
        image.width(UIScreen.main.bounds.width * 0.6)
        //apagar height
        image.height(UIScreen.main.bounds.height * 0.5)
        //image.backgroundColor = .blue
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.width(UIScreen.main.bounds.width - 40)
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Nome do filme assim assado a vinganca"
        return label
    }()
    
    private var summaryLabel: UILabel = {
        let label = UILabel()
        label.width(UIScreen.main.bounds.width - 40)
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text = "Stan burns down his home and takes a job as a carny with a traveling carnival. Stan is disturbed at how any man could sink to the level of performing as a geek. Clem explains that he seeks out alcoholic or drug-addicted men with troubled pasts, and lures them in with promises of a \"temporary\" job and opium-laced alcohol. He then uses their dependence until they sink into madness and depravity, thus creating a new geek. Stan also works with clairvoyant act \"Madame Zeena\" and her alcoholic husband, Pete. He and Zeena warn Stan not to ever use these skills otherwise people get hurt. Meanwhile Stan becomes attracted to fellow performer Molly and approaches her with an idea for a two-person act away from the carnival."
        return label
    }()
    
    private var datasheetLabel: UILabel = {
        let label = UILabel()
        label.text = "Ficha Técnica"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private var genresLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Gênero", value: "acao, aventura, alguma")
        return label
    }()
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Duração", value: label.timeFormatter(time: 120))
        return label
    }()
    
    private var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Lançamento", value: label.convertDate(string: "2021-12-01"))
        return label
    }()
    
    private var popularityLabel: UILabel = {
        let label = UILabel()
        label.customLabel(label: "Popularidade", value: "\(78.07)")
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBlack
        navigationController?.configure(title: "")
        
        configureView()
    }
    
    private func configureView() {
        view.addSubview(scrollView)
        scrollView.addSubview(posterImage)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(summaryLabel)
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
        
        nameLabel.topToBottom(of: posterImage, offset: 20)
        nameLabel.centerXToSuperview()
        
        summaryLabel.topToBottom(of: nameLabel, offset: 20)
        summaryLabel.centerXToSuperview()
        
        datasheetLabel.topToBottom(of: summaryLabel, offset: 30)
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
    
    
//    func genreFormatter(array: [String]) -> String{
//
//        var genreList: [String] = []
//
//        for genre in array {
//            genreList.append(genre.name)
//        }
//
//        let returnString = genreList.joined(separator: ", ")
//
//        return returnString
//    }
}
