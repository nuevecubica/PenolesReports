//
//  res_operacion_19.swift
//  Penoles AI-2017
//
//  Created by alex vaught on 6/20/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class res_operacion_19Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    return res_operacion_19ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
  }
}


class res_operacion_19ViewController: PageWithButtonsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    
    
    //**************************************
    // Button sulfato de sodio
    //**************************************
    let button_oro = UIButton(frame: CGRect())
    button_oro.addTarget(self, action: #selector(button_oro_Pressed(_:)), for: .touchUpInside)
    button_oro.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_oro)
    button_oro.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_oro.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 280.0 * imageScale),
      button_oro.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  380.0 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button oxido de manganeso
    //**************************************
    let button_plata = UIButton(frame: CGRect())
    button_plata.addTarget(self, action: #selector(button_plata_Pressed(_:)), for: .touchUpInside)
    button_plata.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_plata)
    button_plata.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_plata.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 560.0 * imageScale),
      button_plata.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  390.0 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button sulfato de manganeso
    //**************************************
    let button_plomo = UIButton(frame: CGRect())
    button_plomo.addTarget(self, action: #selector(button_plomo_Pressed(_:)), for: .touchUpInside)
    button_plomo.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_plomo)
    button_plomo.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_plomo.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 280.0 * imageScale),
      button_plomo.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  620.0 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button sulfato de amonio
    //**************************************
    let button_zinc = UIButton(frame: CGRect())
    button_zinc.addTarget(self, action: #selector(button_zinc_Pressed(_:)), for: .touchUpInside)
    button_zinc.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_zinc)
    button_zinc.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_zinc.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 560.0 * imageScale),
      button_zinc.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  620.0 * imageScale)
      ])
    //*************************************
    
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  
  @IBAction func button_oro_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag19_SulfatoSodio"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_plata_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag20_OxicoMagnesio"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_plomo_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag21_SulfatoMagnesio"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_zinc_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag22_SulfatoAmonio"))
    //showVideoPopup(videoName: "video")
  }
  
  
}

