//
//  ViewController.swift
//  URLSessionPostDemo
//
//  Created by Mac on 26/05/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters = ["name":"Nilesh Uttekar","job":"iOS Application Developer"]
        
        //let parameters = "\"job\":\"iOS Application Developer\",\"name\":\"Nilesh Uttekar\""
        
        
        var urlRequest = URLRequest(url: URL(string: "https://reqres.in/api/users")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("Content-Type", forHTTPHeaderField: "application/json")
        
        guard let requestBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {
            return
        }
        
        
        urlRequest.httpBody = requestBody
        let decoded = String(data: requestBody, encoding: .utf8)!
        print(decoded);
        
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
            
            do{
                let response = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(response)
                
            }
            catch
            {
                print("Exceptions");
            }
        }).resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

