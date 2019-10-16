//
//  ImageView.swift
//  MultiTouch
//
//  Created by jeffrey chiang on 10/15/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ImageController: UIViewController {
    
    var imageArray = [UIImage]()
    public let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    func setupImages(_ images: [UIImage]){

        for i in 0..<images.count {

            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit

            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
            scrollView.delegate = self as? UIScrollViewDelegate
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      // Do any additional setup after loading the view.
        view.addSubview(scrollView)

    }

}
