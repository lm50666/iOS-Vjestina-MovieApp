//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Luka Macan on 16.04.2022..
//

import Foundation
import UIKit

class SearchBarView: UIView,UITextFieldDelegate{
    
    private var stackView: UIStackView!
    private var imageView: UIImageView!
    private var image: UIImage!
    private var image2: UIImage!
    private var textField: UITextField!
    private var xButton: UIButton!
    private var cancelButton: UIButton!
    
    init() {
        super.init(frame: .zero)
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
        stackView = UIStackView()
        
        textField = UITextField()
        image = UIImage(systemName: "magnifyingglass")

        imageView = UIImageView(image: image)

        cancelButton = UIButton()

        
    }
    func addViews(){
//        addSubview(textField)
        textField.leftView = imageView
        addSubview(stackView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(cancelButton)
        
    }
    func styleViews(){
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        
        textField.isUserInteractionEnabled = true
        textField.placeholder = "  Search"
        textField.backgroundColor = UIColor.lightGray
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cancelButton.isHidden = true
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .red
    }
    func addConstraints(){
        stackView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    @objc func buttonAction(sender: UIButton!){
        sender.removeFromSuperview()
        textField.text = ""
        textField.resignFirstResponder()
        self.superview?.subviews[1].isHidden = false
        self.superview?.subviews[2].isHidden = false
        self.superview?.subviews[3].isHidden = false
        self.superview?.subviews[4].isHidden = false
        self.superview?.subviews[5].isHidden = true
        
        
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.isHidden = false
        stackView.addArrangedSubview(cancelButton)
        self.superview?.subviews[1].isHidden = true
        self.superview?.subviews[2].isHidden = true
        self.superview?.subviews[3].isHidden = true
        self.superview?.subviews[4].isHidden = true
        self.superview?.subviews[5].isHidden = false
        
    }
    
    
}

