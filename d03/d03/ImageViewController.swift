//
//  ImageViewController.swift
//  d03
//
//  Created by Mykola ZHURBA on 10/4/19.
//  Copyright © 2019 mzhurba. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView?
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: image)
        scrollView.addSubview(imageView!)
        scrollView.contentSize = (imageView?.frame.size)!
        scrollView.maximumZoomScale = 100
        scrollView.minimumZoomScale = 0.1
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
