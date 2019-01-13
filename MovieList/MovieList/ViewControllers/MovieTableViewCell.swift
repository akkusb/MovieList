//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import UIKit

class MovieTableViewCell: BaseTableViewCell {
    
    var movie: MovieModel?
    
    @IBOutlet weak var moviePosterImageView: BaseImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func refreshCellWithData(_ cellData: Any?) {
        self.movie = cellData as? MovieModel
        
        self.movieTitleLabel.text = self.movie?.Title
        self.moviePosterImageView.loadImage(url: self.movie?.Poster)
    }
    
}
