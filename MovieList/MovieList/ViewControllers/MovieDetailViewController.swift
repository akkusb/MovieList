//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movie : MovieModel?{
        didSet{
            self.movieDetailDictionary = movie?.getDetailDictionary()
        }
    }
    
    var movieDetailDictionary : [String:String]?{
        didSet{
            self.movieDetailDictionaryKeys = movieDetailDictionary?.keys.sorted()
        }
    }
    var movieDetailDictionaryKeys : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initialize() {
        self.title = self.movie?.Title
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "KeyValueTableViewCell", bundle: nil), forCellReuseIdentifier: "KeyValueTableViewCell")
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell : KeyValueTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KeyValueTableViewCell", for: indexPath) as? KeyValueTableViewCell{
            
            let currentKey = self.movieDetailDictionaryKeys?[indexPath.row]
            let currentValue = self.movieDetailDictionary?[currentKey!]
            
            cell.keyLabel.text = currentKey
            cell.valueLabel.text = currentValue
            
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieDetailDictionaryKeys?.count ?? 0
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
