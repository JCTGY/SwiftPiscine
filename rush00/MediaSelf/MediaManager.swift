//
//  MediaPlayer.swift
//  MediaSelf
//
//  Created by jeffrey chiang on 10/5/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class MediaManager {
    
    var avPlyer: AvPlayer
    
    init(url: String) {
        self.avPlyer =  AvPlayer(url: url)
    }
}
