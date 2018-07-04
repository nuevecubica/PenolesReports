//
//  des_amb_6.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/19/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class des_amb_6Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    return des_amb_6ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
  }
}

class des_amb_6ViewController: PageWithButtonsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    //**************************************
    // Button Índice de ecoeficiencia eléctrica GL
    //**************************************
    let button_iae1 = UIButton(frame: CGRect())
    button_iae1.addTarget(self, action: #selector(button_iae1_Pressed(_:)), for: .touchUpInside)
    button_iae1.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_iae1)
    button_iae1.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_iae1.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 40.0 * imageScale),
      button_iae1.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  880.0 * imageScale)
      ])
    //**************************************
    //**************************************
    
    //**************************************
    // Button Índice de ecoeficiencia eléctrica GEI
    //**************************************
    let button_iae2 = UIButton(frame: CGRect())
    button_iae2.addTarget(self, action: #selector(button_iae2_Pressed(_:)), for: .touchUpInside)
    button_iae2.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_iae2)
    button_iae2.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_iae2.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 40.0 * imageScale),
      button_iae2.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  2110.0 * imageScale)
      ])
    //**************************************
    //**************************************
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  @IBAction func button_iae1_Pressed(_ sender: UIButton) {
    showImagePopup(image: #imageLiteral(resourceName: "indice_consumo_energeticos_2") )
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_iae2_Pressed(_ sender: UIButton) {
    showImagePopup(image: #imageLiteral(resourceName: "indice_consumo_energeticos_1") )
    //showVideoPopup(videoName: "video")
  }
  
}

