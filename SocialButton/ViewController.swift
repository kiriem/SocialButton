//
//  ViewController.swift
//  SocialButton
//
//  Created by Kyrie Miyajima on 2015/02/11.
//  Copyright (c) 2015年 Kirie Miyajima. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor();
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.24, green:0.35, blue:0.6, alpha:1);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        let twitterImage:UIImage? = UIImage(named: "twitter.png");
        let facebookImage:UIImage? = UIImage(named: "facebook.png");
        
        //Twitterのボタン
        let twitterButton:UIButton = UIButton(frame: CGRectMake(0, 0, 1139/7, 926/7));
        twitterButton.setImage(twitterImage, forState: UIControlState.Normal);
        twitterButton.layer.position = CGPoint(x: self.view.frame.width/3*1, y: 200);
        twitterButton.addTarget(self, action: Selector("tweet:"), forControlEvents: .TouchUpInside);
        
        self.view.addSubview(twitterButton);
        
        
        //Facebookのボタン
        let facebookButton:UIButton = UIButton(frame: CGRectMake(0, 0, 150, 150));
        facebookButton.setImage(facebookImage, forState: UIControlState.Normal);
        facebookButton.layer.position = CGPoint(x: self.view.frame.width/3*2, y: 400);
        facebookButton.addTarget(self, action: Selector("facebook:"), forControlEvents: .TouchUpInside);
        self.view.addSubview(facebookButton);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tweet(sender: AnyObject){
        let tweetVC = TwitterViewController();
        self.navigationController?.pushViewController(tweetVC, animated: true);
    }
    
    func facebook(sender: AnyObject){
        let facebookVC = FacebookViewController();
        self.navigationController?.pushViewController(facebookVC, animated: true);
    }
}

