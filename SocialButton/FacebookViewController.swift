//
//  FacebookViewController.swift
//  SocialButton
//
//  Created by Kyrie Miyajima on 2015/02/11.
//  Copyright (c) 2015年 Kirie Miyajima. All rights reserved.
//

import UIKit
import Social

class FacebookViewController: UIViewController, UITextFieldDelegate {
    
    var facebookComposeView: SLComposeViewController!

    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = "Facebook";
        self.view.backgroundColor = UIColor.whiteColor();
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor();
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.24, green:0.35, blue:0.6, alpha:1);
        
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
        
        var textValue:String = textField.text;
    
        facebookComposeView = SLComposeViewController(forServiceType: SLServiceTypeFacebook);
        facebookComposeView.setInitialText("\(textValue) \(time) #アプリ開発中につき無視してください");
        self.presentViewController(facebookComposeView, animated: true, completion: nil);
    
        return true;
        
    }
}