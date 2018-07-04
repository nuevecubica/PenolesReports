//
//  res_operacion_8.swift
//  Penoles AI-2017
//
//  Created by alex vaught on 6/20/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class res_operacion_8Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    return res_operacion_8ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
  }
}

class res_operacion_8ViewController: PageWithButtonsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    
    
    //**************************************
    // Button oro
    //**************************************
    let button_oro = UIButton(frame: CGRect())
    button_oro.addTarget(self, action: #selector(button_oro_Pressed(_:)), for: .touchUpInside)
    button_oro.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_oro)
    button_oro.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_oro.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 210.0 * imageScale),
      button_oro.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  180.0 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button plata
    //**************************************
    let button_plata = UIButton(frame: CGRect())
    button_plata.addTarget(self, action: #selector(button_plata_Pressed(_:)), for: .touchUpInside)
    button_plata.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_plata)
    button_plata.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_plata.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 490.0 * imageScale),
      button_plata.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  180.0 * imageScale)
      ])
    //*************************************
    //*************************************
    // Button plomo
    //**************************************
    let button_plomo = UIButton(frame: CGRect())
    button_plomo.addTarget(self, action: #selector(button_plomo_Pressed(_:)), for: .touchUpInside)
    button_plomo.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_plomo)
    button_plomo.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_plomo.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 780.0 * imageScale),
      button_plomo.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  180.0 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button zinc
    //**************************************
    let button_zinc = UIButton(frame: CGRect())
    button_zinc.addTarget(self, action: #selector(button_zinc_Pressed(_:)), for: .touchUpInside)
    button_zinc.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_zinc)
    button_zinc.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_zinc.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 360.0 * imageScale),
      button_zinc.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  420 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button cobre
    //**************************************
    let button_cobre = UIButton(frame: CGRect())
    button_cobre.addTarget(self, action: #selector(button_cobre_Pressed(_:)), for: .touchUpInside)
    button_cobre.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_cobre)
    button_cobre.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_cobre.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 700.0 * imageScale),
      button_cobre.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  420 * imageScale)
      ])
    //*************************************
    
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  
  @IBAction func button_oro_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag8_Oro"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_plata_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag9_Plata"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_plomo_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag10_Plomo"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_zinc_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag10_Zinc"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_cobre_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "res_ope_pag11_Cobre"))
    //showVideoPopup(videoName: "video")
  }
  
}
