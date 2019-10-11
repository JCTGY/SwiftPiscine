//
//  ViewController.swift
//  MediaSelf
//
//  Created by jeffrey chiang on 10/5/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import YoutubePlayerView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        moviestore.fetchMovie(){
            object in
            Movie.movieStats = object!
            print(Movie.movieStats.page)
            
        }
        //moviestore.fetchVideos(movieID: 475557)
        //playerView.loadWithVideoId("TPjAsus_bZo")
        // Do any additional setup after loading the view.
    }
    var moviestore = MovieDataAPI()
    
    @IBOutlet weak var playerView: YoutubePlayerView!
    
    //    @IBAction func playButton(_ sender: UIButton) {
//    guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else {
//        return
//        }
//        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
//        let player = AVPlayer(url: url)
//
//        // Create a new AVPlayerViewController and pass it a reference to the player.
//        let controller = AVPlayerViewController()
//        controller.player = player
//
//        // Modally present the player and call the player's play() method when complete.
//        present(controller, animated: true) {
//            player.play()
//        }
//    }
}

