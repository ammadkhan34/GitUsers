//
//  GitProfileXib.swift
//  getmydata
//
//  Created by Ammad on 03/09/2022.
//

import UIKit

class GitProfileXib: UITableViewCell {

    @IBOutlet weak var notes: UIImageView!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profileimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setdataincell(_ notes:String,_ details1:String,_ username:String,_ profileimg:String){
        self.details.text = details1
        self.username.text = username
        self.profileimg.image = UIImage(named: profileimg)
        self.notes.image = UIImage(named: profileimg)
        
        let url = URL(string: notes)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //self.notes.image = UIImage(data: data!)
        self.profileimg.image=UIImage(data: data!)
        self.profileimg.layer.borderWidth = 1.0
        self.profileimg.layer.masksToBounds = false
        self.profileimg.layer.borderColor = UIColor.white.cgColor
        self.profileimg.layer.cornerRadius = self.profileimg.frame.size.width / 2
        self.profileimg.clipsToBounds = true
    }
    
    
    
}


