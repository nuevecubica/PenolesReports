//
//  des_soc_30.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/21/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//



import UIKit

class des_soc_30Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    let vc = des_soc_30ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
    vc.magazine = magazine
    return vc
  }
}

class des_soc_30ViewController: PageWithButtonsViewController {
  var magazine: Magazine!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    
    //*************************************
    //**************************************
    // Button Volumen de ventas Quimicos
    //**************************************
    let button_vvq = UIButton(frame: CGRect())
    button_vvq.addTarget(self, action: #selector(button_vvq_Pressed(_:)), for: .touchUpInside)
    button_vvq.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_vvq)
    button_vvq.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_vvq.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 45.0 * imageScale),
      button_vvq.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  480.0 * imageScale)
      ])
    //*************************************
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  
  @IBAction func button_vvq_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "pag_30_NiveldeplomoensangreenPoblacion", inMagazine: magazine)!)
  }
  
}

