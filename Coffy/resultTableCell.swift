//
//  resultTableCell.swift
//  Coffy
//
//  Created by Quang Bach on 4/4/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class resultTableCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var imageBg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var data: StoreService!
    
    func configCell(data: StoreService){
        self.data = data
        self.name.text = data.name
        self.type.text = data.octime
        self.address.text = data.address
        imageBg.image = UIImage(named: data.type)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
