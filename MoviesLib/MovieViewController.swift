//
//  ViewController.swift
//  MoviesLib
//
//  Created by Eric on 06/03/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbGenre: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var tvSinopsis: UITextView!
    @IBOutlet weak var lcButtonX: NSLayoutConstraint!
    
    // MARK: Properties
    var movie: Movie!
    
    
    // MARK: Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivPoster.image = UIImage(named: movie.imageWide)
        lbTitle.text = movie.title
        lbGenre.text = movie.categoriesDescription
        lbDuration.text = movie.duration
        lbScore.text = "⭐️ \(movie.rating)/10"
        tvSinopsis.text = movie.summary
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
