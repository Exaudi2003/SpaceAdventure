//
//  SettingViewController.swift
//  Space Advanture
//
//  Created by Foundation-009 on 26/06/24.
//

import UIKit
import AVFoundation

class SettingViewController: UIViewController {

    @IBOutlet weak var pausePlayButton: UIButton!
    var playerVidio: AVPlayer?
    var isPause = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playVideo()
    }
    
    func playVideo() {
        guard let videoLocation = Bundle.main.path(forResource: "bgvidio", ofType: "mp4") else {
            return
        }
        
        playerVidio = AVPlayer(url: URL(filePath: videoLocation))
        let videoView = AVPlayerLayer(player: playerVidio)
        videoView.frame = CGRect(x: 130, y: -50, width: 500, height: 500)
        view.layer.addSublayer(videoView)
        playerVidio?.play()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func PauseVidio(_ sender: Any) {
        if !isPause {
            pausePlayButton.setTitle("Play", for: .normal)
            isPause = true
            playerVidio?.pause()
        }else {
            pausePlayButton.setTitle("Pause", for: .normal)
            isPause = false
            playerVidio?.play()
        }
        
    }
    
    @IBAction func goBackHome(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
