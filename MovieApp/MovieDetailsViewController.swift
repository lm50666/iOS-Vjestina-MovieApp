//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Luka Macan on 29.03.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController{
    
    private var backgroundImage: UIImage!
    private var starImage: UIImage!
    private var backgroundImageView: UIImageView!
    private var imageStarView: UIImageView!
    private var genreLabel: UILabel!
    private var durationLabel: UILabel!
    private var dateLabel: UILabel!
    private var countryLabel: UILabel!
    private var titleLabel: UILabel!
    private var yearLabel: UILabel!
    private var scoreLabel: UILabel!
    private var userScoreLabel: UILabel!
    private var overviewLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var roleLabel1: CustomRoleView!
    private var roleLabel2: CustomRoleView!
    private var roleLabel3: CustomRoleView!
    private var roleLabel4: CustomRoleView!
    private var roleLabel5: CustomRoleView!
    private var roleLabel6: CustomRoleView!
    private var stackView1: UIStackView!
    private var stackView2: UIStackView!
    
    private var scrollView: UIScrollView!
    private var contentView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    private func buildViews() {
            initialize()
            addSubviews()
            addConstraints()
            styleViews()
    }
    
    private func initialize(){
        scrollView = UIScrollView()
        contentView = UIView()
        backgroundImage = UIImage(named: "ironman.jpeg")
        backgroundImageView = UIImageView(image: backgroundImage)
        genreLabel = UILabel()
        durationLabel = UILabel()
        dateLabel = UILabel()
        countryLabel = UILabel()
        titleLabel = UILabel()
        yearLabel = UILabel()
        scoreLabel = UILabel()
        userScoreLabel = UILabel()
        
        starImage = UIImage(systemName: "star")
        imageStarView = UIImageView(image: starImage)
        
        overviewLabel = UILabel()
        descriptionLabel = UILabel()
        roleLabel1 = CustomRoleView(name: "Don  Heck", role: "Characters")
        roleLabel2 = CustomRoleView(name: "Jack Kirby", role: "Characters")
        roleLabel3 = CustomRoleView(name: "Jon Favreau", role: "Director")
        roleLabel4 = CustomRoleView(name: "Don  Heck", role: "Screenplay")
        roleLabel5 = CustomRoleView(name: "Jack Marcum", role: "Screenplay")
        roleLabel6 = CustomRoleView(name: "Matt Holloway", role: "Screenplay")
        
        stackView1 = UIStackView()
        stackView1.axis = .horizontal
        stackView1.alignment = .fill
        stackView1.distribution = .fillEqually
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.addArrangedSubview(roleLabel1)
        stackView1.addArrangedSubview(roleLabel2)
        stackView1.addArrangedSubview(roleLabel3)
        
        stackView2 = UIStackView()
        stackView2.axis = .horizontal
        stackView2.alignment = .fill
        stackView2.distribution = .fillEqually
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.addArrangedSubview(roleLabel4)
        stackView2.addArrangedSubview(roleLabel5)
        stackView2.addArrangedSubview(roleLabel6)
    }
    private func styleViews(){
        
        view.backgroundColor = .white
        
        genreLabel.text = "Action,Science Fiction,Adventure"
        genreLabel.font = .systemFont(ofSize: 12)
        genreLabel.textColor = .white
        genreLabel.numberOfLines = 0
        
        dateLabel.text = "05/02/2008"
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .white
        dateLabel.numberOfLines = 0
        
        countryLabel.text = "(US)"
        countryLabel.font = .systemFont(ofSize: 12)
        countryLabel.textColor = .white
        countryLabel.numberOfLines = 0
        
        durationLabel.text = "2h 6m"
        durationLabel.font = .systemFont(ofSize: 12,weight: .bold)
        durationLabel.textColor = .white
        durationLabel.numberOfLines = 0
        
        titleLabel.text = "Iron man"
        titleLabel.font = .systemFont(ofSize: 25,weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        
        yearLabel.text = "(2008)"
        yearLabel.font = .systemFont(ofSize: 25)
        yearLabel.textColor = .white
        yearLabel.numberOfLines = 0
        
        scoreLabel.text = "76%"
        scoreLabel.font = .systemFont(ofSize: 12,weight: .bold)
        scoreLabel.textColor = .white
        scoreLabel.numberOfLines = 0
        
        userScoreLabel.text = "User score"
        userScoreLabel.font = .systemFont(ofSize: 12,weight: .bold)
        userScoreLabel.textColor = .white
        userScoreLabel.numberOfLines = 0
        
        imageStarView.layer.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.6).cgColor
        imageStarView.layer.cornerRadius = imageStarView.bounds.width / 2
        imageStarView.clipsToBounds = false
        imageStarView.layer.masksToBounds = false
        imageStarView.tintColor = .white
        
        overviewLabel.text = "Overview"
        overviewLabel.font = .systemFont(ofSize: 25,weight: .bold)
        overviewLabel.textColor = .black
        overviewLabel.numberOfLines = 0
        
        descriptionLabel.text = "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
    }
        
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backgroundImageView)
        
        contentView.addSubview(overviewLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(stackView1)
        contentView.addSubview(stackView2)
        
        backgroundImageView.addSubview(genreLabel)
        backgroundImageView.addSubview(durationLabel)
        backgroundImageView.addSubview(dateLabel)
        backgroundImageView.addSubview(countryLabel)
        backgroundImageView.addSubview(titleLabel)
        backgroundImageView.addSubview(yearLabel)
        backgroundImageView.addSubview(scoreLabel)
        backgroundImageView.addSubview(userScoreLabel)
        backgroundImageView.addSubview(imageStarView)
    }
    
    private func addConstraints() {
        backgroundImageView.snp.makeConstraints {
                $0.bottom.equalTo(contentView.snp.centerY)
                $0.trailing.leading.equalToSuperview()
                $0.top.equalTo(contentView.safeAreaLayoutGuide)
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
        }
        durationLabel.snp.makeConstraints{
            $0.bottom.equalTo(imageStarView.snp.top).offset(-15)
            $0.leading.equalTo(genreLabel.snp.trailing).offset(20)
        
        }
        genreLabel.snp.makeConstraints{
            $0.bottom.equalTo(imageStarView.snp.top).offset(-15)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
        
        }
        dateLabel.snp.makeConstraints{
            $0.bottom.equalTo(genreLabel.snp.top).offset(-4)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
        
        }
        countryLabel.snp.makeConstraints{
            $0.bottom.equalTo(genreLabel.snp.top).offset(-4)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(12)
        
        }
        titleLabel.snp.makeConstraints{
            $0.bottom.equalTo(dateLabel.snp.top).offset(-8)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
        }
        yearLabel.snp.makeConstraints{
            $0.bottom.equalTo(dateLabel.snp.top).offset(-5)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(12)
        }
        scoreLabel.snp.makeConstraints{
            $0.bottom.equalTo(titleLabel.snp.top).offset(-2)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
        }
        userScoreLabel.snp.makeConstraints{
            $0.bottom.equalTo(titleLabel.snp.top).offset(-2)
            $0.leading.equalTo(scoreLabel.snp.trailing).offset(12)
        }
        imageStarView.snp.makeConstraints {
            $0.bottom.equalTo(backgroundImageView.snp.bottom).inset(15)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(20)
        }
        overviewLabel.snp.makeConstraints{
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(backgroundImageView.snp.bottom).offset(20)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(overviewLabel.snp.bottom).offset(8)
        }
        stackView1.snp.makeConstraints {
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
        }
        stackView2.snp.makeConstraints {
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(stackView1.snp.bottom).offset(20)
//            $0.bottom.lessThanOrEqualTo(contentView.snp.bottom)
//            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
