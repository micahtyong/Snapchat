//
//  ImagePickerViewController.swift
//  Snapchat
//
//  Created by Micah Yong on 2/28/19.
//  All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    var imageData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logoutHandler(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ImagePickerViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! MyImageCell
        cell.myImage.image = UIImage(named: imageData.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageName = imageData.images[indexPath.row]
        print(imageName)
        performSegue(withIdentifier: "postToFeed", sender: imageName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let feedPicker = segue.destination as? FeedPickerViewController {
            print(sender as? String ?? "no sender name")
            feedPicker.imageNameVar = sender as? String ?? "Micah"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenConstant: CGFloat = 2.05
        let width = self.view.frame.width/screenConstant
        let height = self.view.frame.width/screenConstant
        return CGSize(width: width, height: height)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
