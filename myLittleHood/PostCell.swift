//
//  PostCell.swift
//  myLittleHood
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }

    func configureCell(post: Post){
        titleLabel.text = post.title
        descLabel.text = post.postDesc
        postImage.image = DataService.instance.imageForPath(post.imagePath)
    }
    
}
