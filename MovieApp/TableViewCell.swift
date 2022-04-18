//
//  TableViewCell.swift
//  MovieApp
//
//  Created by Luka Macan on 18.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

class TableViewCell: UITableViewCell{
    static let identifier = "TableViewCell"
    private var myImage: UIImageView!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var cellView: UIView!
    
    private var cornerRadius: CGFloat = 40
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildCell()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func buildCell(){ //set views in the cell
        
        cellView = UIView()
        myImage = UIImageView()
        myImage.clipsToBounds = true
        myImage.contentMode = .scaleAspectFit
        myImage.layer.masksToBounds = true
        self.addSubview(cellView)
        cellView.addSubview(myImage)
        
        titleLabel = UILabel()
        addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        addSubview(descriptionLabel)
        
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
    }
    
    public func configure(id: UUID, movies: Array<MovieModel>, bounds: CGRect){
        
        for movie in movies{
            if movie.id == id{
                
                let url = URL(string: movie.imageUrl)
                let data = try? Data(contentsOf: url!)
                myImage.image = UIImage(data: data!)
                
                let mutableString = movie.title + " (" + String(movie.year) +  ")"
                let attributedTitle = NSMutableAttributedString(string: mutableString)
                attributedTitle.addAttribute(.font, value: UIFont(name: "ArialRoundedMTBold", size: 25) as Any, range: NSRange(location: 0, length: mutableString.count))
                titleLabel.attributedText = attributedTitle
                titleLabel.numberOfLines = 0
                titleLabel.lineBreakMode = .byWordWrapping
                titleLabel.textAlignment = .natural
                titleLabel.sizeToFit()
                
                //set description of a movie
                let attributedText = NSMutableAttributedString(string: movie.description)
                attributedText.addAttribute(.font, value: UIFont(name: "Arial", size: 16) as Any, range: NSRange(location: 0, length: movie.description.count))
                descriptionLabel.attributedText = attributedText
                descriptionLabel.numberOfLines = 0
                descriptionLabel.lineBreakMode = .byWordWrapping
                descriptionLabel.textAlignment = .natural
                descriptionLabel.sizeToFit()
                self.clipsToBounds = true
                
                
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImage.image = nil
        titleLabel.attributedText = nil
        descriptionLabel.attributedText = nil
    }
    
    //cell constraints
    func addConstraints(){
        cellView.snp.makeConstraints{
            $0.leading.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        myImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(135)
            $0.height.equalTo(200)
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalTo(myImage.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(myImage.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
