//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 大島秀平 on 2021/04/21.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var startStopBtn: UIButton!
    var dispImageNum: Int = 0
    let imgName:[String] = ["img1.jpeg","img2.jpeg","img3.jpeg"]
    var timer: Timer!
    var fStartSlide: Bool = false

    @IBAction func startStop(_ sender: Any) {
        if fStartSlide == false{
            startSlideShow()
            fStartSlide = true
        }else{
            stopSlideShow()
            fStartSlide = false
        }
    }
    
    @IBAction func forwardImage(_ sender: Any) {
        if dispImageNum == 2{
            dispImageNum = 0
        }else{
            dispImageNum += 1
        }
        slideImageView.image = getImage(num: dispImageNum)
    }
    
    @IBAction func backImage(_ sender: Any) {
        if dispImageNum == 0{
            dispImageNum = 2
        }else{
            dispImageNum -= 1
        }
        slideImageView.image = getImage(num: dispImageNum)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped(_:)))
        // デリゲートをセット
        tapGesture.delegate = self
        self.slideImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "toMagView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMagView" {
            let magViewCon = segue.destination as! MagViewController
            magViewCon.magImage = slideImageView.image
            stopSlideShow()
            fStartSlide = false
        }
    }
    
    func startSlideShow(){
        startTimer()
        forwardBtn.isEnabled = false//進む戻るボタンを無効にする
        backBtn.isEnabled = false//進む戻るボタンを無効にする
        startStopBtn.setTitle("停止", for: .normal)//停止ボタンに変える
    }
    func stopSlideShow(){
        stopTimer()
        forwardBtn.isEnabled = true//進む戻るボタンを有効にする
        backBtn.isEnabled = true//進む戻るボタンを有効にする
        startStopBtn.setTitle("再生", for: .normal)//再生ボタンに変える
    }

    @objc func completeTimer(_ timer: Timer){
        if dispImageNum == 2{
            dispImageNum = 0
        }else{
            dispImageNum += 1
        }
        slideImageView.image = getImage(num: dispImageNum)
    }
    
    func getImage(num:Int) -> UIImage{
        var img: UIImage?
        img = UIImage(named: imgName[dispImageNum])
        return img!
    }
    
    func startTimer(){
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(completeTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer(){
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

