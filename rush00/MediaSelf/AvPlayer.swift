//
//  MediaManager.swift
//  MediaSelf
//
//  Created by jeffrey chiang on 10/5/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class AvPlayer {
    
    let videoURL: URL?
    
    let player: AVPlayer?
    let vc = AVPlayerViewController()
    
    init(url: String) {
        self.videoURL = URL(fileURLWithPath: url)
        self.player = AVPlayer(url: videoURL!)
        vc.player = player
    }
}
