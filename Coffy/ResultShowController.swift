//
//  ResultShowController.swift
//  Coffy
//
//  Created by Quang Bach on 4/4/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class ResultShowController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var _result : [StoreService] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultService: [StoreService] {
        get{
            return _result
        } set {
            _result = newValue
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view2:\(_result) haha")
        
        navigationItem.title = _result[0].type
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "resultTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CellTable")
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _result.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! resultTableCell
        cell.configCell(data: _result[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.width/2.51
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = _result[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! DetailCotroller
            let data = sender as! StoreService
            destination.data = data
        }
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
