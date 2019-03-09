//
//  ImageFeed.swift
//  Snapchat
//
//  Created by Micah Yong on 3/6/19.
//  All rights reserved.
//

import Foundation
import UIKit

// TREAT AS GLOBAL VARIABLE FOR SNAPS
// @source https://stackoverflow.com/questions/26195262/how-to-create-a-global-variable
// Access using ImageFeed.snapData[<key>] = <value>
struct ImageFeed {
    static var snapData = [String: [Snap]]() // [feed : list of snaps]
    static var feeds = ["Landscapes", "People", "City Life", "Animals", "CS198-01"]
}
