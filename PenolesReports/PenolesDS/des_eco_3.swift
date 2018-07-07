//
//  des_eco_3.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 6/13/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class des_eco_3Page: ImagePage {
  override func viewController(with magazine: Magazine) -> UIViewController {
    let vc = des_eco_3ViewController(image: UIImage(named: imageName, inMagazine: magazine)!)
    vc.magazine = magazine
    return vc
  }
}

class des_eco_3ViewController: PageWithButtonsViewController {
  var magazine: Magazine!

  override func viewDidLoad() {
    super.viewDidLoad()

    imageView.isUserInteractionEnabled = true
    
    let imageScale = view.bounds.width / imageView.image!.size.width
    
    let icon = "plus"
    let icon2 = "play_orange"
    
    //**************************************
    // Button VALOR GENERADO
    //**************************************
    let button_vg = UIButton(frame: CGRect())
    //button.setTitle("Blah", for: .normal)
    //button.setTitleColor(.orange, for: .normal)
    button_vg.addTarget(self, action: #selector(btn_vg_Pressed(_:)), for: .touchUpInside)
    button_vg.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_vg)
    button_vg.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_vg.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 428.5 * imageScale),
      button_vg.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  314.0 * imageScale)
      ])
    //**************************************
    //**************************************
    // Button VALOR DISTRIBUIDO
    //**************************************
    let button_vd = UIButton(frame: CGRect())
    //button.setTitle("Blah", for: .normal)
    //button.setTitleColor(.orange, for: .normal)
    button_vd.addTarget(self, action: #selector(btn_vd_Pressed(_:)), for: .touchUpInside)
    button_vd.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_vd)
    button_vd.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_vd.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 428.5 * imageScale),
      button_vd.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  555.0 * imageScale)
      ])
    //**************************************
    //**************************************
    // Button APORTACIONES A LA COMUNIDAD
    //**************************************
    let button_ac = UIButton(frame: CGRect())
    //button.setTitle("Blah", for: .normal)
    //button.setTitleColor(.orange, for: .normal)
    button_ac.addTarget(self, action: #selector(btn_ac_Pressed(_:)), for: .touchUpInside)
    button_ac.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_ac)
    button_ac.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_ac.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 854.9 * imageScale),
      button_ac.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  284.2 * imageScale)
      ])
    //*************************************
    //**************************************
    // Button DERRAMA ECONOMICA 2017
    //**************************************
    let button_de = UIButton(frame: CGRect())
    //button.setTitle("Blah", for: .normal)
    //button.setTitleColor(.orange, for: .normal)
    button_de.addTarget(self, action: #selector(btn_de_Pressed(_:)), for: .touchUpInside)
    button_de.setImage(UIImage(named : icon), for: UIControlState.normal)
    imageView.addSubview(button_de)
    button_de.translatesAutoresizingMaskIntoConstraints = false
    
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_de.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 854.9 * imageScale),
      button_de.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  1010.0 * imageScale)
      ])
    //*************************************
    
    //**************************************
    // Button video capsula desempeño economico
    //**************************************
    let button_vid = UIButton(frame: CGRect())
    button_vid.addTarget(self, action: #selector(btn_vid_Pressed(_:)), for: .touchUpInside)
    button_vid.setImage(UIImage(named : icon2), for: UIControlState.normal)
    imageView.addSubview(button_vid)
    button_vid.translatesAutoresizingMaskIntoConstraints = false
    /*
     button_vid.layer.shadowColor = UIColor.black.cgColor
     button_vid.layer.shadowOffset = CGSize(width: 5, height: 5)
     button_vid.layer.shadowRadius = 5
     button_vid.layer.shadowOpacity = 1.0
     */
    // Image coords divided by 3
    NSLayoutConstraint.activate([
      button_vid.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 480.0 * imageScale),
      button_vid.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  625.0 * imageScale)
      ])
    //**************************************
    //**************************************
  }
  
  //*****************************************
  // PRESS FUNCTIONS
  //*****************************************
  @IBAction func btn_vg_Pressed(_ sender: UIButton) {
    showImagePopup(image: UIImage(named: "valor_genarado", inMagazine: magazine)!)
  }
  @IBAction func btn_vd_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "valoe_distributivo", inMagazine: magazine)!)
  }
  @IBAction func btn_ac_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "aportaciones", inMagazine: magazine)!)
  }
  @IBAction func btn_de_Pressed(_ sender: UIButton) {
    showImagePopup(image:UIImage(named: "derrama_economica", inMagazine: magazine)!)
  }
  @IBAction func btn_vid_Pressed(_ sender: UIButton) {
    
    showVideoPopup(vimeoId: "278336617")
  }
}
