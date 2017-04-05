//
//  ViewController.swift
//  Coffy
//
//  Created by Quang Bach on 4/4/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit



@objc
class ViewController: UIViewController {

    @IBOutlet weak var typeLocationSeach: UISegmentedControl!
    
    @IBOutlet weak var distanceSlider: UISlider!
    
    @IBOutlet weak var typeStoreSeg: UISegmentedControl!
    
    @IBOutlet weak var sliderValue: UILabel!
    
    var array = [StoreService]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       sliderValue.text = "\(distanceSlider.value)"
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func changValue(_ sender: Any) {
        sliderValue.text = "\(Int(distanceSlider.value))"
    }
    
    
    
    func post(completion: @escaping () -> () ){
        
        var url: URL?
        var type = ""
        var dict: JSONDictionary?

        array = []
        
        switch typeStoreSeg.selectedSegmentIndex {
        case 0:
            type = "coffee"
        case 1:
            type = "restaurant"
        default:
            type = "coffee"
        }
        
        switch typeLocationSeach.selectedSegmentIndex {
        case 0:
            url = URL(string: URL_GNEAR)
            dict = ["lat": "21.014825","long":"105.846336","r":"\(Int(distanceSlider.value))","type": type]
        case 1:
            url = URL(string: URL_DISTRICT)
            dict = ["type": type,"district": "hai ba trung"]
        default:
            url = URL(string: URL_GNEAR)
            dict = ["lat": "21.014825","long":"105.846336","r":"\(Int(distanceSlider.value))","type": type]
        }
        
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var body = ""
        
        for (key, value) in dict! {
            let value = value as! String
            body = body.appending(key)
            body = body.appending("=")
            body = body.appending(value.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
            body = body.appending("&")
        }
        print(body)
        let data = body.data(using: .utf8)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = data
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let responseHTTP = response as? HTTPURLResponse, responseHTTP.statusCode == 200 {
                    
                        guard let resultData = data else {return}
                    
                        do{
                            let arrayJSONDict = try! JSONSerialization.jsonObject(with: resultData, options: []) as! [JSONDictionary]
                            for dict in arrayJSONDict {
                                let post = StoreService(result: dict)
                                self.array.append(post!)
                                print(self.array)
                            }
                        }
                    }
                    completion()
                }
            }
        task.resume()
    }
    

    @IBAction func searchInformationAction() {
        post { () in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toTableView", sender: nil)

            }
        }
       
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTableView" {
            let destination = segue.destination as? ResultShowController
            destination?.resultService = array
        }
    }

}

