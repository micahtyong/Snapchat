//
//  FeedTableViewCell.swift
//  Snapchat
//
//  Created by Micah Yong on 3/6/19.
//  All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var readStatus: UIImageView!
    @IBOutlet weak var timeAgo: UILabel!
    
    func setSnap(snap: Snap) {
        profilePic.image = snap.senderProfilePic
        userName.text = snap.senderName
        
        if snap.readStatus == true {
            readStatus.image = UIImage(named: "read")
        } else {
            readStatus.image = UIImage(named: "unread")
        }
        
        timeAgo.text = snap.timeStamp
    }
    
}
