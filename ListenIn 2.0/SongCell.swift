//
//  SongCell.swift
//  ListenIn 2.0
//
//  Created by Sam Lee on 2/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class SongCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    let albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        
        return imageView
    }()
    
    let songTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .gray
        
        return label
    }()
    
    let artistTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        
        return label
    }()
    
    func setupView() {
        // add views into collection item
        addSubview(albumArtImageView)
        addSubview(songTitleLabel)
        addSubview(artistTitleLabel)
        
        // constraints for album art
        addConstraintsWithFormat(format: "H:|-5-[v0(45)]-5-[v1]-5-|", views: albumArtImageView, songTitleLabel)
        addConstraintsWithFormat(format: "V:|-5-[v0(45)]", views: albumArtImageView)
        
        // constraints for song title
        addConstraint(NSLayoutConstraint(item: songTitleLabel, attribute: .top, relatedBy: .equal, toItem: albumArtImageView, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: songTitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // constraints for artist
        addConstraint(NSLayoutConstraint(item: artistTitleLabel, attribute: .left, relatedBy: .equal, toItem: albumArtImageView, attribute: .right, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: artistTitleLabel, attribute: .right, relatedBy: .equal, toItem: songTitleLabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: artistTitleLabel, attribute: .top, relatedBy: .equal, toItem: songTitleLabel, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: artistTitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    // Stream line addConstraints() for ease of use
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}
