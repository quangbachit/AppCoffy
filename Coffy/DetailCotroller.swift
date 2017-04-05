//
//  DetailCotroller.swift
//  Coffy
//
//  Created by Quang Bach on 4/5/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class DetailCotroller: UIViewController {

    
    private var _data: StoreService!
    
    var data: StoreService {
        get{
            return _data
        } set {
            _data = newValue
        }
    }
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var octime: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    func updateUI(){
        print("this is data:", _data)
        
        detailsView.layer.cornerRadius = 5
        detailsView.layer.shadowOffset = CGSize(width: 5, height: 2)
        detailsView.layer.shadowColor = UIColor.black.cgColor
        detailsView.layer.shadowOpacity = 0.5
        
        
        
        name.text = _data.name
        address.text = _data.address
        octime.text = _data.octime
        rate.text = "\(Int(_data.rate))🎖"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func pop(){
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
