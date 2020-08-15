//
//  VideoDetailViewController.swift
//  YtApi
//
//  Created by usr on 2020/8/15.
//

import UIKit
import YouTubePlayer // Youtube 播放套件
import YoutubeDirectLinkExtractor // Youtube 影片連結套件
import AVKit

class VideoDetailViewController: UIViewController {
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    var item: Item!
    var looper: AVPlayerLooper?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        //play()
    }
    
    func updateUI() {
        titleLabel.text = item.snippet.title
        descTextView.text = item.snippet.description
        
        let request = URLRequest(url: URL(string: item.snippet.thumbnails.medium.url)!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.videoImageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
    func play() {
        
        /* 利用套件 YoutubeDirectLinkExtractor 取得影片連結 */
        let videoID = item.contentDetails.videoId
        let linkExtractor = YoutubeDirectLinkExtractor()
        linkExtractor.extractInfo(for: .id(videoID)) { [self] (info) in
            //print(info.highestQualityPlayableLink!)
            if let urlStr = info.highestQualityPlayableLink {
                
                DispatchQueue.main.async {
                    self.descTextView.text = urlStr
                    /*if let player: AVPlayer? = AVPlayer(url: URL(string: urlStr)!) {
                        let playerViewController = AVPlayerViewController()
                        playerViewController.player = player
                        
                        self.present(playerViewController, animated: true) {
                            playerViewController.player?.play()
                        }
                    }*/
                }
                
                /* 彼得潘的方法
                //let playerItem = AVPlayerItem(url: URL(string: urlStr)!)
                //let player = AVQueuePlayer()
                //self.looper = AVPlayerLooper(player: player, templateItem: playerItem)
                DispatchQueue.main.async {
                    let playerViewController = AVPlayerViewController()
                    playerViewController.player = AVQueuePlayer()
                    self.present(playerViewController, animated: true) {
                        playerViewController.player?.play()
                    }
                }
                 */
            }
            
        } failure: { (error) in
            print(error)
        }
        
    }
}

