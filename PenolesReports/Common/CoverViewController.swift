//
//  CoverViewController.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/1/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class CoverPage: Page {
  var theBg: String = ""
  var theFront: String = ""
  var theTitle: String = ""
  
  init(theBg:String, theFront:String, theTitle:String){
    self.theBg = theBg
    self.theFront = theFront
    self.theTitle = theTitle
  }
  
  func viewController(with magazine: Magazine) -> UIViewController {
    let coverViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "coverViewController") as! CoverViewController
    
    coverViewController.magazine = magazine
    coverViewController.oBg = theBg
    coverViewController.oFront = theFront
    coverViewController.oTitle = theTitle
    
    return coverViewController
  }
}

class CoverViewController: UIViewController {
  var magazine: Magazine! = nil
  var oBg: String! = nil
  var oFront: String! = nil
  var oTitle: String! = nil
  
  var image: UIImage! = nil
  
  var coverHidden: Bool = true
  
  @IBOutlet weak var backgroundImageCover: UIImageView!
  @IBOutlet weak var textImageCover: UIImageView!
  @IBOutlet weak var frontImageCover: UIImageView!
  
  override func viewDidLoad(){
    super.viewDidLoad()
    
    changeImageBGCover(oBg,oTitle,oFront)
  }
  
  // ASSING A BACKGROUND IMAGE TO THE VIEW
  func changeImageBGCover(_ bk: String,_ txt: String,_ front: String) {
    backgroundImageCover.image = UIImage(named: bk, inMagazine: magazine)
    textImageCover.image = UIImage(named: txt, inMagazine: magazine)
    frontImageCover.image = UIImage(named: front, inMagazine: magazine)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    textImageCover.alpha = 0.0
    frontImageCover.alpha = 0.0
    coverHidden = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  func animateIntro() {
    guard coverHidden == true else { return }
    coverHidden = false
    UIView.animate(withDuration: 1.5, delay:1.0, options: .curveEaseOut, animations: {
      self.textImageCover.alpha = 1.0
    })
    UIView.animate(withDuration: 2.5, animations: {
      self.frontImageCover.alpha = 1.0
    })
  }
  
}


