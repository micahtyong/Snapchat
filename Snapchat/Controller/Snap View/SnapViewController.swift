//
//  SnapViewController.swift
//  Snapchat
//
//  Created by Micah Yong on 3/7/19.
//  All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {
    
    var snapImage: UIImage = UIImage(named: "snapchatIcon")!
    
    @IBOutlet weak var snapImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snapImageView.image = snapImage
    }
    
    @IBAction func handleTap(recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
