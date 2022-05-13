//
//  ViewController.swift
//  Softgames@Test
//
//  Created by Mohamed Rabie on 5/13/22.
//

import UIKit
import WebKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {
    
    // Outlet
    @IBOutlet weak var webView: WKWebView!
    
    // Variable
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadHtmlFile()
        
        // Assing self delegate on userNotificationCenter
        self.userNotificationCenter.delegate = self
        self.requestLocalNotificationAuthorization()
        //self.sendLocalNotification(title: "Solitaire smash", body: "Play again to smash your top score")
        
        // Do any additional setup after loading the view.
    }
    
    /* Task 1: WebView to Swift communication */
    
    // Load Html File
    private func loadHtmlFile(){
        // Adding html content
        do {
            guard let filePath = Bundle.main.path(forResource: "softgames", ofType: "html")
            else {
                // File Error
                print ("File reading error")
                return
            }
            
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            webView.loadHTMLString(contents as String, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
        }
    }
    
    // Create Sync Button Action
    // Recive Name Concate First and Last and Pass it to Html File
    private func getNameFromHtml(fName: String,lName: String){
        DispatchQueue.main.sync {
            
        }
    }
    
    private func passFullNameToHtml(fName: String,lName: String){
        DispatchQueue.main.sync {
            
        }
    }
    
    // Create Async Button Action with delay 5 seconds
    // Recive DateOfBirth and Pass it to Html File after delay
    private func getDateOfBirthFromHtml(dateOfBirth: String){
        DispatchQueue.main.async {
            
        }
    }
    
    private func passDateOfBirthToHtml(dateOfBirth: String){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            
        }
    }
    
    /* Task 2: Local Notifications */
    
    // Create NotifyMe Button Action with delay 7 seconds
    private func notifyMeFromHtml(){
        
        // The notification should be displayed.
        self.sendLocalNotification(title: "Solitaire smash", body: "Play again to smash your top score")
        
        // Close the app.
        
        // exit(0)
    }
    
    // Request Permission to recive local notification
    func requestLocalNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    // Send Local Nofifcation
    func sendLocalNotification(title: String,body: String) {
        // Create new notifcation content instance
        let notificationContent = UNMutableNotificationContent()
        
        // Add the content to the notification content
        notificationContent.title = "\(title)"
        notificationContent.body = "\(body)"
        notificationContent.badge = NSNumber(value: 1)
        
        // call this trigger after 7 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: "softNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
}

