//
//  modelo_negocio_3.swift
//  Penoles AI-2017
//
//  Created by alex vaught on 6/20/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class modelo_negocio_3Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    return modelo_negocio_3ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
  }
}

class modelo_negocio_3ViewController: PageWithButtonsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    
    //*************************************
    //**************************************
    // Button Cifras financieras sobresalientes
    //**************************************
    let button_cfs = UIButton(frame: CGRect())
    button_cfs.addTarget(self, action: #selector(button_cfs_Pressed(_:)), for: .touchUpInside)
    button_cfs.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_cfs)
    button_cfs.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_cfs.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 854.9 * imageScale),
      button_cfs.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  454.0 * imageScale)
      ])
    //*************************************
    //*************************************
    //**************************************
    // Button Ventas por producto
    //**************************************
    let button_vp = UIButton(frame: CGRect())
    button_vp.addTarget(self, action: #selector(button_vp_Pressed(_:)), for: .touchUpInside)
    button_vp.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_vp)
    button_vp.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_vp.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 200.0 * imageScale),
      button_vp.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  1300.0 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button Estructura del costo
    //**************************************
    let button_ec = UIButton(frame: CGRect())
    button_ec.addTarget(self, action: #selector(button_ec_Pressed(_:)), for: .touchUpInside)
    button_ec.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_ec)
    button_ec.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_ec.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 200.0 * imageScale),
      button_ec.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  1580.0 * imageScale)
      ])
    //*************************************
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  
  @IBAction func button_cfs_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "mn_CifrasFinancierasSobresalientes"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_vp_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "mn_VentasporProducto"))
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_ec_Pressed(_ sender: UIButton) {
    showImagePopup(image:#imageLiteral(resourceName: "mn_EstructuradelCosto"))
    //showVideoPopup(videoName: "video")
  }
}

