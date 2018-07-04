//
//  UIImageExtensions.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 7/1/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import UIKit

extension UIImage {
  convenience init?(named: String, inMagazine magazine: Magazine) {
    let jpgPath = magazine.directory.appendingPathComponent("\(named)@3x.jpg").path
    if FileManager.default.fileExists(atPath: jpgPath) {
      self.init(contentsOfFile: jpgPath)
    } else {
      let pngPath = magazine.directory.appendingPathComponent("\(named)@3x.png").path
      self.init(contentsOfFile: pngPath)
    }


  }
}
