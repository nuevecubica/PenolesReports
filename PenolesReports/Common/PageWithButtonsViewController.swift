//
//  PageWithButtonsViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 6/13/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit
import AVKit
import YTVimeoExtractor

class PageWithButtonsViewController: PageViewController {
  func showImagePopup(image: UIImage) {
    let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "imagePopup") as! ImagePopupViewController
    popupVC.image = image
    
    present(popupVC, animated: true, completion: nil)
  }
  
  func showVideoPopup(vimeoId: String) {
    let processingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "processing")
    
    processingVC.modalTransitionStyle = .crossDissolve
    processingVC.modalPresentationStyle = .overCurrentContext
    
    present(processingVC, animated: true) {
      YTVimeoExtractor.shared().fetchVideo(withVimeoURL: "https://vimeo.com/\(vimeoId)", withReferer: nil) { (video, error) in
        var streamURL = video?.httpLiveStreamURL
        if streamURL == nil { streamURL = video?.streamURLs[720] }
        if streamURL == nil { streamURL = video?.highestQualityStreamURL() }
        
        self.dismiss(animated: true, completion: {
          guard streamURL != nil else {
            let alertController = UIAlertController(title: "error".localized(), message: "error_occurred".localized(), preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
          }
          
          let player = AVPlayer(url: streamURL!)
          let playerController = VideoPlayerViewController()
          playerController.player = player
          
          playerController.modalTransitionStyle = .crossDissolve
          
          self.present(playerController, animated: true) {
            player.play()
          }
        })
        
        
      }
    }
    
    
  }
}
