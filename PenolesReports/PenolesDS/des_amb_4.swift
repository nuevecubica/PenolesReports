//
//  des_amb_4.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/14/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class des_amb_4Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    let vc = des_amb_4ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
    vc.magazine = magazine
    return vc
  }
}

class des_amb_4ViewController: PageWithButtonsViewController {
  var magazine: Magazine!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    //**************************************
    // Button Índice de ecoeficiencia uso de agua
    //**************************************
    let button_ia = UIButton(frame: CGRect())
    button_ia.addTarget(self, action: #selector(btn_ia_Pressed(_:)), for: .touchUpInside)
    button_ia.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_ia)
    button_ia.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_ia.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 853.0 * imageScale),
      button_ia.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  400.0 * imageScale)
      ])
    //**************************************
    //**************************************
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  @IBAction func btn_ia_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "indicie_consumo_agua", inMagazine: magazine)!)
    //showVideoPopup(videoName: "video")
  }
  
}

