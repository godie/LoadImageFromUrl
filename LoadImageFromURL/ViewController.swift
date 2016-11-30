//
//  ViewController.swift
//  LoadImageFromURL
//
//  Created by Godie A. on 29/11/16.
//  Copyright © 2016 Godieboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadImage("https://dummyimage.com/300x300/0F0F0F/00FF00.png&text=Loaded+Image!", inView: imageView)
    }
    
    func downloadImage(_ uri : String, inView: UIImageView){
        
        let url = URL(string: uri)
        
        let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
            if error == nil{
                if let data = responseData {
                    
                    DispatchQueue.main.async {
                        inView.image = UIImage(data: data)
                    }
                    
                }else {
                    print("no data")
                }
            }else{
                print(error)
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

