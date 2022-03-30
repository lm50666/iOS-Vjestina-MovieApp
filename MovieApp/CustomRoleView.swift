//
//  CustomRoleView.swift
//  MovieApp
//
//  Created by Luka Macan on 30.03.2022..
//

import Foundation
import UIKit
import SnapKit


class CustomRoleView:UIView{
    
    private var name : String?
    private var role : String?
    private var nameLabel : UILabel!
    private var roleLabel : UILabel!
    
    init(name: String, role: String) {
        super.init(frame: .zero)
            
        self.name = name
        self.role = role
        buildViews()
    }
    required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func buildViews(){
        createViews()
        addSubviews()
        styleViews()
        addConstraints()
        
    }
    
    private func createViews(){
        nameLabel = UILabel()
        roleLabel = UILabel()
        
    }
    private func addSubviews(){
        addSubview(nameLabel)
        addSubview(roleLabel)
    }
    private func styleViews(){
        nameLabel.text = name
        roleLabel.text = role
        nameLabel.font = .systemFont(ofSize: 12,weight: .bold)
        roleLabel.font = .systemFont(ofSize: 12)
        nameLabel.textColor = .black
        roleLabel.textColor = .black
        
    }
    private func addConstraints(){
        nameLabel.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
            
        
        }
        roleLabel.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
        $0.top.equalTo(nameLabel.snp.bottom)
        
        
        
        }
    }
}
    

