//
//  ViewController.swift
//  getmydata
//
//  Created by Ammad on 09/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label2: UILabel!
    var res=Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("yes")
        var loaddata=Upload(label2)
        loaddata.gettodata(loaddata)
        //loaddata.printdata()
    
    
    }
    
    
    
    
    
    

    
    
    
    
    

    
    
    
    
    
    
    
   
    
  

}


