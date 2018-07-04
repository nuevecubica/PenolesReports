//
//  MapViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class AIEspMapPage: Page {
  func viewController(with magazine: Magazine) -> UIViewController {
    let mapVC = UIStoryboard(name: "AIEsp", bundle: nil).instantiateViewController(withIdentifier: "mapViewController") as! AIEspMapViewController
    mapVC.magazine = magazine
    return mapVC
  }
}

class AIEspMapViewController: UIViewController {
  var magazine: Magazine!

  @IBOutlet weak var emptyMapImageView: UIImageView!
  @IBOutlet weak var backgroundImage: UIImageView!
  @IBOutlet weak var btn_exploration: UIButton!
  @IBOutlet weak var btn_minas: UIButton!
  @IBOutlet weak var btn_metales: UIButton!
  @IBOutlet weak var btn_quimicos: UIButton!
  @IBOutlet weak var btn_minas_rentadas: UIButton!
  @IBOutlet weak var btn_minas_restauradas: UIButton!
  @IBOutlet weak var btn_subsidiarias: UIButton!
  @IBOutlet weak var scrollerView: UIScrollView!
  @IBOutlet weak var mapaScrollView: UIScrollView!
  @IBOutlet weak var downIcon: UIImageView!


  @IBAction func btn_exploration(_ sender: UIButton) {
    changeImage("mapa_btn1")
    scrollerView.alpha = 0
    changeiconStatus()
  }
  @IBAction func btn_minas(_ sender: UIButton) {
    changeImage("mapa_btn2")
    scrollerView.alpha = 0
    changeiconStatus()
  }

  @IBAction func btn_metales(_ sender: UIButton) {
    changeImage("mapa_btn3")
    scrollerView.alpha = 0
    changeiconStatus()
  }

  @IBAction func btn_quimicos(_ sender: UIButton) {
    changeImage("mapa_btn4")
    scrollerView.alpha = 0
    changeiconStatus()
  }

  @IBAction func btn_minas_rentadas(_ sender: UIButton) {
    changeImage("mapa_btn6")
    scrollerView.alpha = 0
    changeiconStatus()
  }


  @IBAction func btn_minas_restauradas(_ sender: UIButton) {
    changeImage("mapa_btn5")
    scrollerView.alpha = 0
    changeiconStatus()
  }



  @IBAction func btn_subsidiarias(_ sender: UIButton) {
    changeImage("mapa_btn7")
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
    backgroundImage.image = UIImage(named: name, inMagazine: magazine)
    UIView.animate(withDuration: 0.5) {
      self.backgroundImage.alpha = 1
    }

  }

  // ASSING A BACKGROUND IMAGE TO THE scroller
  func changeImageScroller(_ name: String) {
    scrollerImage.image = UIImage(named: name, inMagazine: magazine)
    //print(scrollerImage.frame.size.height)
  }
}
