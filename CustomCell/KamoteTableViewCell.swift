//
//  KamoteTableViewCell.swift
//  ToPisoX
//
//  Created by LinuxPlus on 8/26/18.
//  Copyright © 2018 private. All rights reserved.
//

import UIKit

class KamoteTableViewCell: UITableViewCell {

    var _customerCode: String?
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBAction func buttonOneAction(_ sender: Any) {
        
        print ("Printed \(_customerCode!)")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
