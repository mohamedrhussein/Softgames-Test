//
//  ViewController.swift
//  Softgames@Test
//
//  Created by Mohamed Rabie on 5/13/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    // Outlet
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadHtmlFile()
        
        // Do any additional setup after loading the view.
    }
    
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
}

