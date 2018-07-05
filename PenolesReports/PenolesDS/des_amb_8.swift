//
//  des_amb_8.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/19/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//



import UIKit

class des_amb_8Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    let vc = des_amb_8ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
    vc.magazine = magazine
    return vc
  }
}

class des_amb_8ViewController: PageWithButtonsViewController {
  var magazine: Magazine!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    
    //**************************************
    // Button concentración de plomo Metalrúrgica
    //**************************************
    let button_cpm = UIButton(frame: CGRect())
    button_cpm.addTarget(self, action: #selector(button_cpm_Pressed(_:)), for: .touchUpInside)
    button_cpm.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_cpm)
    button_cpm.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_cpm.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 40.0 * imageScale),
      button_cpm.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  540.0 * imageScale)
      ])
    //**************************************
    //**************************************
    
    //**************************************
    // Button concentración promedio diario de SO2
    //**************************************
    let button_cso = UIButton(frame: CGRect())
    button_cso.addTarget(self, action: #selector(button_cso_Pressed(_:)), for: .touchUpInside)
    button_cso.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_cso)
    button_cso.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_cso.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 465.0 * imageScale),
      button_cso.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  300.0 * imageScale)
      ])
    //**************************************
    //**************************************
    
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  @IBAction func button_cpm_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "concentracion_plomo_metalurgica", inMagazine: magazine)!)
    //showVideoPopup(videoName: "video")
  }
  @IBAction func button_cso_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "concentracion_diario_so", inMagazine: magazine)!)
    //showVideoPopup(videoName: "video")
  }
  
}

