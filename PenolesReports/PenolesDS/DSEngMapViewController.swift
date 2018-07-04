//
//  DSEngMapViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class DSEngMapPage: Page {
  func viewController(with magazine: Magazine) -> UIViewController {
    let mapVC = UIStoryboard(name: "DSEng", bundle: nil).instantiateViewController(withIdentifier: "mapViewController") as! DSEngMapViewController
    mapVC.magazine = magazine
    return mapVC
  }
}

class DSEngMapViewController: UIViewController {
  var magazine: Magazine!
  
  
  @IBOutlet weak var emptyMapImageView: UIImageView!
  @IBOutlet weak var backgroundImage: UIImageView!
  @IBOutlet weak var btn_exploration: UIButton!
  @IBOutlet weak var btn_minas: UIButton!
  @IBOutlet weak var btn_metales: UIButton!
  @IBOutlet weak var btn_quimicos: UIButton!
  @IBOutlet weak var btn_minas_rentadas: UIButton!
  @IBOutlet weak var btn_minas_cerradas: UIButton!
  @IBOutlet weak var btn_minas_restauradas: UIButton!
  @IBOutlet weak var btn_oficinas_comerciales: UIButton!
  @IBOutlet weak var btn_subsidiarias: UIButton!
  @IBOutlet weak var btn_sonora: UIButton!
  @IBOutlet weak var btn_coahuila: UIButton!
  @IBOutlet weak var btn_zacatecas: UIButton!
  @IBOutlet weak var btn_durango: UIButton!
  @IBOutlet weak var btn_ciudad_mexico: UIButton!
  @IBOutlet weak var btn_chihuahua: UIButton!
  @IBOutlet weak var btn_estado_mexico: UIButton!
  @IBOutlet weak var btn_guerrero: UIButton!
  @IBOutlet weak var btn_oaxaca: UIButton!
  @IBOutlet weak var btn_tamaulipas: UIButton!
  @IBOutlet weak var scrollerView: UIScrollView!
  @IBOutlet weak var mapaScrollView: UIScrollView!
  @IBOutlet weak var downIcon: UIImageView!
  @IBAction func btn_exploration(_ sender: UIButton) {
    changeImage("mapa_uni_exploracion")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  @IBAction func btn_minas(_ sender: UIButton) {
    changeImage("mapa_uni_minas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_metales(_ sender: UIButton) {
    changeImage("mapa_uni_metales")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_quimicos(_ sender: UIButton) {
    changeImage("mapa_uni_quimicos")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_minas_rentadas(_ sender: UIButton) {
    changeImage("mapa_uni_minas_rentadas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_minas_cerradas(_ sender: UIButton) {
    changeImage("mapa_uni_minas_cerradas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_minas_restauradas(_ sender: UIButton) {
    changeImage("mapa_uni_minas_restauradas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_oficinas_comerciales(_ sender: UIButton) {
    changeImage("mapa_uni_oficinas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_subsidiarias(_ sender: UIButton) {
    changeImage("mapa_uni_subsidiarias")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_sonora(_ sender: UIButton) {
    changeImage("mapa_est_sonora")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_coahuila(_ sender: UIButton) {
    changeImage("mapa_est_coahuila")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_zacatecas(_ sender: UIButton) {
    changeImage("mapa_est_zacatecas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_durango(_ sender: UIButton) {
    changeImage("mapa_est_durango")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_cdmx(_ sender: UIButton) {
    changeImage("mapa_est_cdmx")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_chihuahua(_ sender: UIButton) {
    changeImage("mapa_est_chihuahua")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_edomex(_ sender: UIButton) {
    changeImage("mapa_est_edomex")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_guerrero(_ sender: UIButton) {
    changeImage("mapa_est_guerrero")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_oaxaca(_ sender: UIButton) {
    changeImage("mapa_est_oaxaca")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func btn_tamaulipas(_ sender: UIButton) {
    changeImage("mapa_est_tamaulipas")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  
  @IBAction func all_unidades(_ sender: UIButton) {
    changeImage("all_unidades")
    changeImageScroller("all_unidades_scroll")
    scrollerView.alpha = 1
    changeiconStatus()
    scrollerView.setContentOffset(CGPoint.zero, animated: false)
  }
  
  @IBAction func all_estados(_ sender: UIButton) {
    changeImage("all_estados")
    changeImageScroller("all_estados_scroll")
    scrollerView.alpha = 1
    changeiconStatus()
    scrollerView.setContentOffset(CGPoint.zero, animated: false)
  }
  
  func changeiconStatus(){
    if scrollerView.alpha == 1 {
      downIcon.isHidden = false
    }else{
      downIcon.isHidden = true
    }
  }
  
  @IBOutlet weak var scrollerImage: UIImageView!
  
  
  override func viewDidLoad(){
    super.viewDidLoad()
    
    scrollerImage.image = UIImage(named: "all_unidades_scroll", inMagazine: magazine)
    emptyMapImageView.image = UIImage(named: "mapa-solo", inMagazine: magazine)
    
    changeImage("all_unidades")
  }
  
  // ASSING A BACKGROUND IMAGE TO THE VIEW
  func changeImage(_ name: String) {
    backgroundImage.alpha = 0
    backgroundImage.image = UIImage(named: name)
    UIView.animate(withDuration: 0.5) {
      self.backgroundImage.alpha = 1
    }
    
  }
  
  // ASSING A BACKGROUND IMAGE TO THE scroller
  func changeImageScroller(_ name: String) {
    scrollerImage.image = UIImage(named: name)
    //print(scrollerImage.frame.size.height)
  }
}
