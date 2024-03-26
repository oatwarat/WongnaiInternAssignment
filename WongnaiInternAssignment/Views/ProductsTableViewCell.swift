//
// ProductsTableViewCell.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 23/3/2567 BE.
//

import UIKit
import SDWebImage

class ProductsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    // MARK: - Cell Reuse Identifier
    static let reuseIdentifier = "ProductsTableViewCell"
    
    // MARK: - Configure Cell
    func configure(with photo: Photo) {
        nameLabel.text = photo.name
        descriptionLabel.text = photo.description
        likesLabel.text = "\(photo.votesCount)"
        
        if let imageUrl = photo.images.first?.url {
            productImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        } else {
            productImageView.image = nil
        }
    }
    
    // MARK: - Cell Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
}
