//
//  CustomStackPart.swift
//  MovieApp
//
//  Created by Luka Macan on 17.04.2022..
//

import Foundation
import UIKit
import MovieAppData

class CustomStackPart:UIStackView{
    private var group : String!
    private var filters: [String]!
    private var listCategories: [String]!
    private var stackView: UIStackView!
    private var labelName: UILabel!
    
    
    init(group: String, filters: [String]) {
        super.init(frame: .zero)
        self.group = group
        self.filters = filters
        buildViews()
    }
    required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func buildViews(){
        createViews()
        addViews()
        styleViews()
        addConstraints()
        
    }
    func createViews(){
        labelName = UILabel()
        stackView = UIStackView()
       
      
        
        
        
    }
    func addViews(){
        addSubview(labelName)
        for filter in filters{
            let button = UIButton()
            
            if stackView.arrangedSubviews.count == 0 {
                let yourAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 15),
                    .underlineStyle: NSUnderlineStyle.thick.rawValue,
                ]
                
                let attributeString = NSMutableAttributedString(
                    string: filter,
                    attributes: yourAttributes
                )
                button.setAttributedTitle(attributeString, for: .normal)
                button.setTitleColor(.black, for: .normal)
            }
            else{
                let yourAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 15),
            ]
                let attributeString = NSMutableAttributedString(
                    string: filter,
                    attributes: yourAttributes
                )
                button.setTitleColor(.gray, for: .normal)
                button.setAttributedTitle(attributeString, for: .normal)
            }
            button.setTitle(filter, for: .normal)
            
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            
            
        }
        addSubview(stackView)
        
        
    }
    func styleViews(){
        labelName.text = self.group
        labelName.textColor = .black
        labelName.font = .systemFont(ofSize: 25,weight: .bold)
        labelName.numberOfLines = 0
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = true
        
    }
 
    @objc func buttonAction(sender: UIButton!){
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
    ]
        
        for i in 0...stackView.arrangedSubviews.count-1{
            let buttonn = stackView.arrangedSubviews[i] as! UIButton
            let attributeString = NSMutableAttributedString(
                string: buttonn.titleLabel?.text as! String,
                attributes: yourAttributes
            )
            buttonn.setAttributedTitle(attributeString, for: .normal)
            buttonn.setTitleColor(.gray, for: .normal)
        }
        let yourAttributes1: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 15),
            .underlineStyle: NSUnderlineStyle.thick.rawValue,
        ]
        
        let attributeString = NSMutableAttributedString(
            string: sender.titleLabel?.text as! String,
            attributes: yourAttributes1
        )
        sender.setAttributedTitle(attributeString, for: .normal)
        sender.setTitleColor(.black, for: .normal)
    }
    
    func addConstraints(){
        labelName.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            
        }
        stackView.snp.makeConstraints{
            $0.leading.trailing.lessThanOrEqualToSuperview()
            $0.top.equalTo(labelName.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    
        
    }
    
}
