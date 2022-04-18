//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Luka Macan on 16.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

class MovieListViewController: UIViewController{
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var searchBar: SearchBarView!
    private var stackView: UIStackView!
    private var stackView1: CustomStackPart!
    private var stackView2: CustomStackPart!
    private var stackView3: CustomStackPart!
    private var movieModel1: [String]!
    private var movieModel2: [String]!
    private var movieModel3: [String]!
    private var collectionView: UICollectionView!
    private var collectionView2: UICollectionView!
    private var collectionView3: UICollectionView!
    private var tableView: UIView!
    private var movies: [MovieModel]!
    private var moviesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        movieModel1 = []
        movieModel2 = []
        movieModel3 = []
        movies = Movies.all()
        for movie in Movies.all(){
            movieModel3.append(movie.imageUrl)
            for group in movie.group{
                if group == MovieGroup.popular{
                    movieModel1.append(movie.imageUrl)
                }
                if group == MovieGroup.freeToWatch{
                    movieModel2.append(movie.imageUrl)
                }
            }
        }
        }
    
    func buildView(){
        createViews()
        addSubview()
        createTable()
        addConstraints()
        styleViews()
        configureCollectionView()
        addTableConstraints()
        
        
    }
    func createViews(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView2 = UICollectionView(frame: .zero,collectionViewLayout: layout)
        scrollView = UIScrollView()
        contentView = UIView()
        searchBar = SearchBarView()
        stackView = UIStackView()
        tableView = UIView()

    
        stackView1 = CustomStackPart(group:"What is popular",filters: ["Streaming","On TV","For Rent","In Theaters"])
        stackView2 = CustomStackPart(group: "Free to watch", filters: ["Movies","TV"])
        
        
    }
   
    func addSubview(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(searchBar)
        contentView.addSubview(stackView1)
        contentView.addSubview(stackView2)
        contentView.addSubview(collectionView)
        contentView.addSubview(collectionView2)
        contentView.addSubview(tableView)
        tableView.isHidden = true
        
        
    }
    func styleViews(){
        view.backgroundColor = .white
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    func addConstraints(){
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
            
        }
        searchBar.snp.makeConstraints{
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(30)
        }
        stackView1.snp.makeConstraints {
            $0.leading.equalTo(searchBar.snp.leading)
            $0.trailing.equalTo(searchBar.snp.trailing)
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
        }
        stackView2.snp.makeConstraints {
            $0.leading.equalTo(searchBar.snp.leading)
            $0.trailing.equalTo(searchBar.snp.trailing)
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
        }
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            
            $0.top.equalTo(stackView1.snp.bottom).offset(15)
            $0.height.equalTo(200)
        }
        collectionView2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            
            $0.top.equalTo(stackView2.snp.bottom).offset(15)
            $0.height.equalTo(200)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        
        
        
    }
    func configureCollectionView() {
            collectionView.register(CustomPictureView.self, forCellWithReuseIdentifier: CustomPictureView.reuseIdentifier)
            collectionView.dataSource = self
            collectionView.delegate = self
            
            collectionView2.register(CustomPictureView.self, forCellWithReuseIdentifier: CustomPictureView.reuseIdentifier)
            collectionView2.dataSource = self
            collectionView2.delegate = self
        
        }
    func addTableConstraints(){
            tableView.snp.makeConstraints {
                $0.top.equalTo(searchBar.snp.bottom)
                $0.bottom.equalTo(view.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.width.equalTo(view)
            }
        
            moviesTable.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().inset(20)
            }
        }
    
}
extension MovieListViewController: UICollectionViewDelegate {
    
}
extension MovieListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension MovieListViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return movieModel1.count
        }
        else{
            return movieModel2.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomPictureView.reuseIdentifier, for: indexPath) as? CustomPictureView
        else {
            fatalError()
        }
        if collectionView == self.collectionView {
            
            cell.set(url: movieModel1[indexPath.row])
        }
        else{
            
            cell.set(url: movieModel2[indexPath.row])
        }
        
        return cell
    }
    
}
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func createTable(){
        moviesTable = UITableView()
        moviesTable.backgroundColor = .white
        moviesTable.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        moviesTable.dataSource = self
        moviesTable.delegate = self
        tableView.addSubview(moviesTable)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        
        else{
            fatalError()
        }
        cell.configure(id: movies[indexPath.section].id, movies: movies, bounds: cell.bounds)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieModel3.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}


