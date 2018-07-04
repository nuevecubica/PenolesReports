//
//  PageViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class ImagePage: Page {
  let imageName: String
  func viewController(with magazine: Magazine) -> UIViewController {
    return PageViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
  }
  init(imageName: String) {
    self.imageName = imageName
  }
}



class PageViewController: UIViewController {
  var image: UIImage! = nil
  var scrollView: UIScrollView! = nil
  var imageView: UIImageView! = nil
  
  convenience init(image: UIImage) {
    self.init()
    
    self.image = image
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView = UIScrollView()
    scrollView.delegate = self
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 2.0
    
    imageView = UIImageView()
    imageView.contentMode =  .scaleToFill
    imageView.clipsToBounds = true
    imageView.image = image
    
    view.addSubview(scrollView)
    scrollView.addSubview(imageView)
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
      imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: image.size.width / image.size.height)
      ])
  }
}

extension PageViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}

extension PageViewController: ScrollablePageViewController {
  var showsScrollIndicator: Bool {
    return scrollView.contentSize.height > scrollView.bounds.height
  }
}
