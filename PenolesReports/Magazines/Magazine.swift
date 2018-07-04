//
//  Magazine.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 7/1/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import UIKit

protocol Magazine {
  var name: String { get }
  var identifier: String { get }
  var downloadURL: URL { get }
  var directory: URL { get }
  var initialViewController: UIViewController { get }
  var sections: [Section] { get }
}
