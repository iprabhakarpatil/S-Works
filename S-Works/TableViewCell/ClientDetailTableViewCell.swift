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
    
    var order: OrderModel?
    
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func navigationAction(_ sender: Any) {
        
    }
    
    
    @IBAction func callAction(_ sender: Any) {
        if let phoneNumber = order?.phone, let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        } else {
            print("Failed to make call")
        }
    }
}

