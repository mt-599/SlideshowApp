//
//  MagViewController.swift
//  SlideshowApp
//
//  Created by 大島秀平 on 2021/04/22.
//

import UIKit

class MagViewController: UIViewController{

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var magImgView: UIImageView!
    var magImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.scrollView.delegate = self
        // Do any additional setup after loading the view.
        magImgView.image = self.magImage
        
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        // 画像の幅・高さの取得
        let scale:CGFloat = 2.0
        let width:CGFloat = magImage!.size.width
        let height:CGFloat = magImage!.size.height
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        magImgView.frame = rect;
        magImgView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // ボタンの装飾
        backBtn.layer.borderWidth = 0.5                                              // 枠線の幅
        backBtn.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        backBtn.layer.cornerRadius = 5.0                                             // 角丸のサイズ
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
