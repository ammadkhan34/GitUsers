//
//  Upload.swift
//  getmydata
//
//  Created by Ammad on 10/07/2022.
//

import Foundation
import UIKit
class Upload{
    
     var dataobj=Model()
    var mydat1:[single]=[]
    var mylabel:UILabel!
    init(_ label2:UILabel){
        
        mylabel = label2
        
    }
    func gettodata(_ loaddata:Upload){
      
        let myurl="https://cpdev.codingpixel.com/eyecure-web/api/patient/appointments/upcoming"
        let mytok="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTQwY2JhMzM0M2Y4NTVlODY3MjA1ZDE4NDVmOTM3YjVlYmY5OTM3NDZiZWVlNTA0ZjFkOTgzNjJkMWU5MTY3NjY4YmVjZmZhYjg5NWQzYjgiLCJpYXQiOjE2NTcwMjY4MjMuMTcyNDQ3LCJuYmYiOjE2NTcwMjY4MjMuMTcyNDUsImV4cCI6MTY4ODU2MjgyMy4xNjY4NTcsInN1YiI6IjciLCJzY29wZXMiOltdfQ.hGWI946rY-9zfP8Td-ubxUqXad5lgDfx_0SPfGIXw4QiIfC2vOTTJjGu7ftu-BTZ79HrJqeVIzA5LEy2E01D7wD9GG95zHkLifJeOXTFmnCGXeHtjthoZBo6kVjCEoBEbaVb2DN_23McZ6ADSYIb1z9n4tLbi-8cSppNm4xVRd3kBCbWBCdwWeCgRYkL2SAjelaXUiXGzdL2FCMDVaY_O4tMboCrhcs_JTEVe3S_JY9hN7QGtk4W87hzPNKU2_zAJGqdzfHWNahPUKVeDgL-PtBDfMSiZtKUflko5Zk6TIQvzXHCcP6DV7PJpnqoZMgzhO2BTov7oc-_PMjvBfHLaA0SpZg7vtbZm16f_-3PsT_zVrwkgi0Ajfu_WvhoBu6TKfyj-7xr-w6PCF47eqJWTYp923X4nUvqbcr1ZF9zSdq4TgbZOua_8kFv5h6OfvKxHjKVWDlc_36kd3kjEwAEaBdcgPEJpwAmhSdTFucnb2skisYts0aJ-2a-cIbykJPlwFJto7FLLdRRR1VCd4-YyLA5aWx8ux5dXgunxK967Y0l5byz1QHRGjOVPRF_HyJgRzbDLY4g0uAkP1dnx0SvCtAG5g-7n_zdtaKFksN7b6jRHDWJ1oMhyMBm22CxbGvztVQtqhvyZo4Nof1gkJku54c_DxNMJiTI1c1JaQp6nzw"
        let mymet="GET"
        var  myres=self.dataobj.data
       
        var mynetwork=Network()
        print("yes")
        print( mynetwork.loadData(myurl,mytok,mymet,loaddata,myres))
        

    print("yes")
        
    }
    
    func assignme(_ obj:Upload){
        mydat1=obj.mydat1
        
    }
    
    
    func printdata(){
        print("I am inside")
        mylabel.text=mydat1[0].type
        print(mydat1[0].type)
        
    }
    
    

    
    
    
    
}
