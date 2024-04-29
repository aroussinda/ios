//
//  ViewController.swift
//  URLSessionWorkshop
//
//  Created by Marwen Krichen on 7/4/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  postRes()
    }
    
    func getRes()
    {
        //init
        let session = URLSession.shared
        let url = URL(string: "https://reqres.in/api/users/2")!
        //create task
        
        let task = session.dataTask(with: url) {
            data, response, error in
        //test error and data
            if error != nil || data == nil {
                  print("Client error!")
                  return
                  }
        
            guard let response = response as? HTTPURLResponse, (200 == response.statusCode) else {
                   print("Server error!")
                   return
                   }
            do {
                  let json = try JSONSerialization.jsonObject(with: data!, options: [])
                  print(json)
                  } catch {
                  print("JSON error: \(error.localizedDescription)")
                  }
                  }
        task.resume()
        
        }
    
    func postRes() {
        
        let session = URLSession.shared
        let url = URL(string: "https://reqres.in/api/users")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let json = [
            "name": "esprit",
            "job": "iOS"
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        let task = session.uploadTask(with: request, from: jsonData)
        {
            data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
                }
            
            guard let response = response as? HTTPURLResponse, (201 == response.statusCode) else {
             print("Server error!")
             return
             }
            
            do {
                  let json = try JSONSerialization.jsonObject(with: data!, options: [])
                  print(json)
                  } catch {
                  print("JSON error: \(error.localizedDescription)")
                  }
                  }
        task.resume()

        }
    }
        
    


