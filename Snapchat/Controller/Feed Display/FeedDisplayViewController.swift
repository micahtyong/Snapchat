//
//  FeedDisplayViewController.swift
//  Snapchat
//
//  Created by Micah Yong on 3/6/19. All rights reserved.
//

import UIKit

class FeedDisplayViewController: UIViewController {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Discover"
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        loadData()
    }

}

extension FeedDisplayViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ImageFeed.feeds.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ImageFeed.feeds[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let feed = ImageFeed.feeds[section]
        return ImageFeed.snapData[feed]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "snapCell", for: indexPath) as! FeedTableViewCell
        let feed = ImageFeed.feeds[indexPath.section]
        if let snap = ImageFeed.snapData[feed]?[indexPath.row] {
            snap.timeStamp = snap.dateObject.timeAgoDisplay()
            cell.setSnap(snap: snap)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = ImageFeed.feeds[indexPath.section]
        if let snap = ImageFeed.snapData[feed]?[indexPath.row] {
            if snap.readStatus == false {
                performSegue(withIdentifier: "displaySnap", sender: snap)
            }
            loadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let snapView = segue.destination as? SnapViewController {
            let snap = sender as! Snap
            snapView.snapImage = snap.snapPhoto
            snap.readStatus = true
        }
    }
    
    func loadData() {
        feedTableView.reloadData()
    }
    
}
