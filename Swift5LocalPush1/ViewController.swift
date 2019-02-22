//
//  ViewController.swift
//  Swift5LocalPush1
//
//  Created by Naoki Arakawa on 2019/02/21.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func push(_ sender: Any) {
        
        //２種類のテキストをローカルプッシュ通知として自分のスマホに飛ばしたい
        let content = UNMutableNotificationContent()
        
        //タイトル
        content.title = nameTextField.text!
        
        //本文
        content.body = textField.text!
        
        //サウンド
        content.sound = UNNotificationSound.default
        
        //Notification triger
        //５秒後に処理が行われる
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //identifierは"ID", contentは上に定義しているcontent
        //triggerは上に定義している条件
        let request = UNNotificationRequest(identifier: "ID", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        nameTextField.resignFirstResponder()
        textField.resignFirstResponder()
        
        
    }
    

}

