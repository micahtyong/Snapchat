//
//  FeedPickerViewController.swift
//  Snapchat
//
//  Created by Micah Yong on 2/28/19.
//  All rights reserved.
//

import UIKit

class FeedPickerViewController: UIViewController {
    
    var imageNameVar = ""
    var feedNameVar = ""

    @IBOutlet weak var feedTableView: UITableView!
    var feedData = Data()
    
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var feedName: UILabel!

    @IBOutlet weak var fullSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Send To"
        imageName.text = "Posting image: \(imageNameVar)"
        feedName.text = "To feed: \(feedNameVar)"
    }
    
    @IBAction func handleSend(_ sender: UIButton) {
        if imageNameVar.count > 0 && feedNameVar.count > 0 {
            postSnap()
            snapPostedAlert()
            print("Hi")
        } else {
            snapNotPostedAlert()
        }
    }
    
    func postSnap() {
        let snap = Snap(profilePic: UIImage(named: "profile2")!, name: "Micah Yong", feed: feedNameVar, time: Date().timeAgoDisplay(), snap: UIImage(named: imageNameVar)!)
        if ImageFeed.snapData[feedNameVar] != nil {
            ImageFeed.snapData[feedNameVar]?.append(snap)
        } else {
            ImageFeed.snapData[feedNameVar] = [snap]
        }
    }
    
    func snapPostedAlert() {
        let alert = UIAlertController(title: "Snap Posted!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.performSegue(withIdentifier: "postSnapSegue", sender: self)}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func snapNotPostedAlert() {
        let alert = UIAlertController(title: "Snap Not Posted!", message: "Check image and feed choice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension FeedPickerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! TableViewCell
        cell.feedLabel.text = feedData.feeds[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedNameVar = feedData.feeds[indexPath.row]
        feedName.text = "To feed: \(feedNameVar)"
    }

}

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        }
        return "\(secondsAgo / day) days ago"
    }
}
