//
//  ImagePopupViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 6/13/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class ImagePopupViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  
  var image: UIImage? = nil
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    modalTransitionStyle = .crossDissolve
    modalPresentationStyle = .overCurrentContext
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.image = image
  }
  
  @IBAction func dismissPopup(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
