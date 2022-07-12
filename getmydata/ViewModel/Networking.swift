//
//  Networking.swift
//  getmydata
//
//  Created by Ammad on 12/07/2022.
//

import Foundation
import UIKit
class Network{
    
    func loadData(_ myurl:String,_ tok:String,_ met:String,_ loaddata:Upload,_ myres:[single]) {
        var dataobj=myres
         
       

        guard let url = URL(string:myurl ) else {
                print("Invalid URL")
             //   break
          return
            
            }
        
        
        
            var request = URLRequest(url: url)
        request.addValue("Bearer " + tok, forHTTPHeaderField: "Authorization")

        request.httpMethod = met
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
                if let data = data {
                  
                    if let response1   = try? JSONDecoder().decode(Model.self, from: data){
                        DispatchQueue.main.async {
                            var myarr:[single]=response1.data
                          
                            print(myarr[0].type)
                      
                        
                            loaddata.mydat1=myarr
                            loaddata.printdata()
                        
                        }
                  
                    }
               

                }
          
               
            }.resume()
        
  
        return
    }
  
    
}
