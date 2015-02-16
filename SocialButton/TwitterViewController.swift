//
//  TwitterViewController.swift
//  SocialButton
//
//  Created by Kyrie Miyajima on 2015/02/11.
//  Copyright (c) 2015年 Kirie Miyajima. All rights reserved.
//

import UIKit
import Social

class TwitterViewController: UIViewController, UITextFieldDelegate {
    
    var twitterComposeView: SLComposeViewController!

    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = UIColor(red:0.96, green:0.8, blue:0, alpha:1)
        
        self.title = "Twitter";
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.11, green:0.52, blue:0.78, alpha:1);
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor();
        self.view.backgroundColor = UIColor.whiteColor();
        
        let myTextField:UITextField = UITextField(frame: CGRectMake(0, 0, 300, 30));
        myTextField.layer.borderWidth = 1.0;
        myTextField.layer.borderColor = UIColor.blackColor().CGColor;
        myTextField.layer.position = CGPoint(x: self.view.frame.width/2, y: 200);
        myTextField.delegate = self;
        self.view.addSubview(myTextField);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var text = textField.text;
        
        let now = NSDate();
        let dateFormatter = NSDateFormatter();
        
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP");
        dateFormatter.timeStyle = .MediumStyle;
        dateFormatter.dateStyle = .MediumStyle;
        
        var time = dateFormatter.stringFromDate(now);
        
        twitterComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter);
        twitterComposeView.setInitialText("\(text) \(time) #柏Swift勉強会");
        self.presentViewController(twitterComposeView, animated: true, completion: nil);
        
        return true;
    }
    
    
    
}