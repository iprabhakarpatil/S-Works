//
//  ClientDetailTableViewCell.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import UIKit

class ClientDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func prepareForReuse() {
  
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func navigationAction(_ sender: Any) {
        
    }
    
    
    @IBAction func callAction(_ sender: Any) {
        
    }
    
    
}
