//
//  SupportingViewControllers.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 7/4/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import UIKit
import AVKit

class ProcessingViewController: UIViewController {
  override var prefersStatusBarHidden: Bool {
    return true
  }
}

class VideoPlayerViewController: AVPlayerViewController {
  override var prefersStatusBarHidden: Bool {
    return true
  }
}
