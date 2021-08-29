//
//  CommentsTableViewCell.swift
//  WBooks
//
//  Created by daniel.f.munoz on 27/08/21.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!{
        didSet{
            userImage.layer.masksToBounds = false
            userImage.layer.cornerRadius = userImage.frame.height/2
            userImage.clipsToBounds = true
            userImage.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.font = .gillSansBoldSubtitle
            nameLabel.textColor = .black
        }
    }
    @IBOutlet weak var commentLabel: UILabel!{
        didSet{
            commentLabel.font = .gillSansSubtitle
            commentLabel.textColor = .lightGray
        }
    }
    
    static let identifier = "CommentTableViewCell"
    static let nibName = "CommentTableViewCell"
    
    var data: Comment!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.blackSqueeze
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ data: Comment, _ user: User) {
        self.data = data
        self.commentLabel.text = self.data.content
        self.nameLabel.text = user.username
        self.userImage.imageFromUrl(urlString: user.image)
    }

}
