//
//  ViewController.swift
//  YtApi
//
//  Created by usr on 2020/8/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Item]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var request = URLRequest(url: URL(string: PropertyKeys.urlPlaylistStr)!,
                                 timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                
                let playlistData =
                    try JSONDecoder().decode(PlaylistData.self, from: data)
                self.items = playlistData.items
                print("items.count = \(self.items?.count ?? -1)")
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()

    }
    
    /** 切換下一頁並指派資料 */
    @IBSegueAction func showVideo(_ coder: NSCoder) -> VideoDetailViewController? {
        
        let controller = VideoDetailViewController(coder: coder)
        
        if let row = tableView.indexPathForSelectedRow?.row {
            controller?.item = items?[row]
        }
        return controller
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.cellId, for: indexPath) as? VideoTableViewCell
        else { return UITableViewCell() }
        
        let index = indexPath.row
        if let item = items?[index] {
            let video = Video(title: item.snippet.title,
                              thumbNailUrl: URL(string: item.snippet.thumbnails.medium.url)!,
                              videoID: item.contentDetails.videoId)
            cell.update(with: video)
        }
        return cell
    }
    
}
