//
//  ViewController.swift
//  d03
//
//  Created by Mykola ZHURBA on 10/4/19.
//  Copyright © 2019 mzhurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let images: [URL] = [
        URL(string: "https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")!,
        URL(string: "https://hdqwalls.com/download/small-memory-lp-3840x2400.jpg")!,
        URL(string: "https://www.tokkoro.com/picsup/2703648-retro-wave-4k-hd-wallpaper-image.jpg")!,
        URL(string: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/19-03528_-_gpim_final_day1.jpg")!,
        URL(string: "https://www.tokkoro.com/picsup/5074177-retro-wave-sunset.jpg")!,
        URL(string: "https://www.tokkoro.com/picsup/2720487-retro-wave-4k-wallpaper-hq.jpg")!,
        //URL(string: "gg")!
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: self.images[indexPath.row])
            if data != nil {
                DispatchQueue.main.async {
                    cell.loading.hidesWhenStopped = true
                    cell.loading.stopAnimating()
                    cell.image.image = UIImage(data: data!)
                }
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Can not access to \(self.images[indexPath.row])", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        cell.loading.startAnimating()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seg = segue.destination as! ImageViewController
        let cell = sender! as! CollectionViewCell
        if cell.image.image != nil {
            seg.image = cell.image.image!
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Photo can not be displayed", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

