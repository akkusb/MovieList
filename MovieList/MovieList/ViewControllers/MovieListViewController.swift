//
//  MovieListViewController.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies : [MovieModel] = []

    override func initialize() {
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text{
            self.movies.removeAll()
            self.showHud()
            MovieService.getMovieList(query: query, success: { (movieModel) in
                if let movie = movieModel{
                    self.movies.append(movie)
                }
                self.tableView.reloadData()
                self.hideHud()
            }) { (errorModel) in
                self.hideHud()
                UIHelper.showError(error: errorModel)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell : MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell{
            
            let currentMovie = self.movies[indexPath.row]
            
            cell.refreshCellWithData(currentMovie)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMovie = self.movies[indexPath.row]
        self.navigateToMovieDetail(movie: currentMovie)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func navigateToMovieDetail(movie: MovieModel) {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movie
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }

}
