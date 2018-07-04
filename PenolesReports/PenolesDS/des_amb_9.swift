//
//  des_amb_9.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/19/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class des_amb_9Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    return des_amb_9ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
  }
}

class des_amb_9ViewController: PageWithButtonsViewController {
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
      button_ia.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  440.0 * imageScale)
      ])
    //**************************************
    //**************************************
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  @IBAction func btn_ia_Pressed(_ sender: UIButton) {
    showImagePopup(image: #imageLiteral(resourceName: "indice_ecoeficiencia_residuos") )
    //showVideoPopup(videoName: "video")
  }
  
}

