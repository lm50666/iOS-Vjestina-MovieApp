//
//  CustomPictureView.swift
//  MovieApp
//
//  Created by Luka Macan on 17.04.2022..
//

import Foundation
import UIKit

class CustomPictureView:UICollectionViewCell{

    private var label: UILabel!
    private var buttonHeart: UIButton!
    private var imageView: UIImageView!
    private var image: UIImage!
    private var imageMovie: UIImageView!
    
    
    static let reuseIdentifier = String(describing: CustomPictureView.self)
    override init(frame:CGRect){
        super.init(frame: frame)
        buildViews()
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set (url: String){
        var url = URL(string: url)!
        if let data = try? Data(contentsOf: url){
            imageMovie.image = UIImage(data:data)
        }
    }
    
    func buildViews(){
        
       
        
        buttonHeart = UIButton()
        buttonHeart.setImage(UIImage(systemName: "star"), for: .normal)
        buttonHeart.tintColor = .white
        imageMovie = UIImageView()
        
        self.clipsToBounds = true
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        
        layer.borderColor = UIColor.black.cgColor
        
        
        addSubview(imageMovie)
        addSubview(buttonHeart)
       
        
        
    }
    
    func addConstraints() {
        imageMovie.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        buttonHeart.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
    }
    
    

}
