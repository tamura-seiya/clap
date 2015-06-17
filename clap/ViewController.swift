//
//  ViewController.swift
//  clap
//
//  Created by tamura seiya on 2015/06/14.
//  Copyright (c) 2015年 tamura seiya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate {
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer: AVAudioPlayer!
    var soundCount: Int = 0
    
    @IBOutlet weak var resultlabel2 :UIImageView!
    let ResultPic0: UIImage! = UIImage(named: "homework.jpg")
    let ResultPic1: UIImage! = UIImage(named: "ipod.png")
    let ResultPic2: UIImage! = UIImage(named: "stevejobswallpaper-ipad.png")
    let ResultPic3: UIImage! = UIImage(named: "stevejobs1.png")


    override func viewDidLoad() {
        super.viewDidLoad()
        let soundFilePath =
        NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row+1)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton(){
            audioPlayer.numberOfLoops = soundCount
            audioPlayer.play()
        resultlabel2.image = ResultPic0
    
    }
}
