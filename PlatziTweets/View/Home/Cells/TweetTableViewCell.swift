//
//  TweetTableViewCell.swift
//  PlatziTweets
//
//  Created by Field Employee on 7/3/21.
//

import UIKit
//Libreria para traer imagenes de la Web
import Kingfisher

class TweetTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tweetImageView: UIImageView!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(post: Post){
        nameLabel.text = post.author.names
        nicknameLabel.text = post.author.nickname
        messageLabel.text = post.text
        
        if post.hasImage{
            //configurar imagen con KingFisher
            tweetImageView.kf.setImage(with: URL(string: post.imageUrl))
        } else{
            tweetImageView.isHidden = true
            
        }
    }
    
}
