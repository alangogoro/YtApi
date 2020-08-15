//
//  VideoTableViewCell.swift
//  YtApi
//
//  Created by usr on 2020/8/15.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
    }
    
    func update(with video: Video) {
        titleLabel.text = video.title
        
        videoImageView.image = UIImage(systemName: "play.rectangle")
        let request = URLRequest(url: video.thumbNailUrl)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.videoImageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
