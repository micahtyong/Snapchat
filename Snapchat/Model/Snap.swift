//
//  Snap.swift
//  Snapchat
//
//  Created by Micah Yong on 3/6/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    
    var senderProfilePic: UIImage
    var senderName: String
    
    var dateObject: Date
    var timeStamp: String
    var feedChoice: String
    var snapPhoto: UIImage
    var readStatus: Bool
    
    init(profilePic: UIImage, name: String, feed: String, time: String, snap: UIImage) {
        self.senderProfilePic = profilePic
        self.senderName = name
        
        self.feedChoice = feed
        self.dateObject = Date()
        self.timeStamp = time
        self.snapPhoto = snap
        self.readStatus = false
    }
    
}
