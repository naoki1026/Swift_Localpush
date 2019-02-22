//
//  ViewController2.swift
//  Swift5LocalPush1
//
//  Created by Naoki Arakawa on 2019/02/21.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController2: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    //タイマーを用いてな何秒後に表示するという処理を行う
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var textField4: UITextField!
    
    var timer:Timer?
    var count: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func push(_ sender: Any) {
        
        timerUpdate()
        
    }
    
    func timerUpdate() {
        
        let content =  UNMutableNotificationContent()
        let content2 =  UNMutableNotificationContent()
        let content3 =  UNMutableNotificationContent()
        let content4 =  UNMutableNotificationContent()
        
        ///////////////////////content
        
        content.title = nameTextField.text!
        content.sound = UNNotificationSound.default
        content.body = textField1.text!
        
        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request1 = UNNotificationRequest(identifier: "ID2", content: content, trigger: trigger1)
        
        UNUserNotificationCenter.current().add(request1, withCompletionHandler: nil)
        
        ///////////////////////content2
        
        content2.title = nameTextField.text!
        content2.sound = UNNotificationSound.default
        content2.body = textField2.text!
        
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request2 = UNNotificationRequest(identifier: "ID3", content: content2, trigger: trigger2)
        
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
        
         ///////////////////////content3
        
        content3.title = nameTextField.text!
        content3.sound = UNNotificationSound.default
        content3.body = textField3.text!
        
        let trigger3 = UNTimeIntervalNotificationTrigger(timeInterval: 11, repeats: false)
        let request3 = UNNotificationRequest(identifier: "ID4", content: content3, trigger: trigger3)
        
        UNUserNotificationCenter.current().add(request3, withCompletionHandler: nil)
        
         ///////////////////////content4
        
        content4.title = nameTextField.text!
        content4.sound = UNNotificationSound.default
        content4.body = textField4.text!
        
        //Bundleは左側に表示されてるメニューのこと
        if let path = Bundle.main.path(forResource: "bird", ofType: "jpg") {
            
            //content４に貼り付けする
            //何か録音したものをサウンドとしてて添付することもできる
            content4.attachments = [try! UNNotificationAttachment(identifier: "ID5", url: URL(fileURLWithPath: path ), options: nil)]
            
        }
        
        let trigger4 = UNTimeIntervalNotificationTrigger(timeInterval: 14, repeats: false)
        let request4 = UNNotificationRequest(identifier: "ID5", content: content4, trigger: trigger4)
        
        UNUserNotificationCenter.current().add(request4, withCompletionHandler: nil)
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
    }

    

}
