//
//  Model.swift
//  getmydata
//
//  Created by Ammad on 09/07/2022.
//

import Foundation

class Model:Codable{
    
    var data:[single] = []
    
}

struct single:Codable{
    
    
               var id = 7
               var patient_id = 7
               var doctor_id = 3
               var clinic_id = 1
               var date = "2022-12-30"
               var time_slot = "7:30 PM"
               var status = 1
               var treatment_start = 0
               var treatment_completed = 0
               var description = "this is update test"
               var check_in = 0
               var type = "Physical"
               var appointable_type = "App\\Models\\User"
               var appointable_id = 1
               var cancelledBy_type = "App\\Models\\Admin"
               var cancelledBy_id = 1
               var time_slot_id = 2911
               var created_at = "2022-02-09T10:16:26.000000Z"
               var updated_at = "2022-07-06T13:43:21.000000Z"

}
struct Modal:Codable{
    
    var data = [
            
                "id": "7",
                "patient_id": "7",
                "doctor_id": "3",
                "clinic_id": "1",
                "date": "2022-12-30",
                "time_slot": "7:30 PM",
                "status": "1",
                "treatment_start": "0",
                "treatment_completed": "0",
                "description": "this is update test",
                "check_in": "0",
                "type": "Physical",
                "appointable_type": "App\\Models\\User",
                "appointable_id": "1",
                "cancelledBy_type": "App\\Models\\Admin",
                "cancelledBy_id": "1",
                "time_slot_id": "2911",
                "created_at": "2022-02-09T10:16:26.000000Z",
                "updated_at": "2022-07-06T13:43:21.000000Z"]
            
}




