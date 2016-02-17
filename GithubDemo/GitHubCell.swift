//
//  GitHubCell.swift
//  GithubDemo
//
//  Created by Varun Goel on 2/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class GitHubCell: UITableViewCell {
    
    
    @IBOutlet weak var repoTitle: UILabel!
    @IBOutlet weak var repoAuthor: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var repoStars: UILabel!
    @IBOutlet weak var repoForks: UILabel!
    @IBOutlet weak var forksImage: UIImageView!
    @IBOutlet weak var starsImage: UIImageView!
    
    var repository: GithubRepo!{
        didSet{
            repoTitle.text = repository.name
//            repoImage.setImageWithURL(NSURL(fileURLWithPath: (repository.ownerAvatarURL)!))
            repoAuthor.text = repository.ownerHandle
            repoDescription.text = repository.repoDescription
            repoStars.text = String(repository.stars!)
            repoForks.text = String(repository.forks!)

//            addressLabel.text = business.address
//            ratingImageView.setImageWithURL(business.ratingImageURL!)
//            categoriesLabel.text = business.categories
//            reviewsCountLabel.text =  "\(business.reviewCount!) Reviews"
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
      repoTitle.preferredMaxLayoutWidth = repoTitle.frame.size.width
       repoDescription.preferredMaxLayoutWidth = repoDescription.frame.size.width
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        repoTitle.preferredMaxLayoutWidth = repoTitle.frame.size.width
        repoDescription.preferredMaxLayoutWidth = repoDescription.frame.size.width
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
