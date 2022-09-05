//
//  SecondVcViewController.swift
//  getmydata
//
//  Created by Ammad on 03/09/2022.
//

import UIKit
import CoreData
class SecondVcViewController: UIViewController {

    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var followers: UILabel!
   @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var mytxtview: UITextView!
    @IBOutlet weak var myname: UILabel!
    // @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var company: UILabel!
    
    @IBOutlet weak var Blog: UILabel!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
        name.text = mygitdata?.login
       // following.text = mygitdata?.followersURL
       // let url1 = URL(string: mygitdata!.followersURL)
        //let data1 = try? Data(contentsOf: url1!)
      //  print("Followers data is",getcontent(MyUrl:mygitdata!.followersURL ))
       // print("Url1 is",url1)

        followers.text = "Follwers: " + String((getcontent(MyUrl:mygitdata!.followersURL )))
    //    let url2 = URL(string: ((mygitdata!.followingURL).replacingOccurrences(of: "{/other_user}", with: "")))
      //  print("Url2 is",(mygitdata!.followingURL).replacingOccurrences(of: "{/other_user}", with: ""))
        //let data2 = try? Data(contentsOf: url2!)
        //print("Following data is",data2?.count)
        following.text = "Following: " + getcontent(MyUrl: ((mygitdata!.followingURL).replacingOccurrences(of: "{/other_user}", with: "")))
        
        myname.text = "Name :" + mygitdata!.login
        
        self.company.text = "Company :"

        let url3 = URL(string:  mygitdata!.organizationsURL)
        print("Data is",url3)
        
        
        var companyurl:String = ""
        if let url = URL(string: mygitdata!.organizationsURL) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let res = try JSONDecoder().decode(Company.self, from: data)
                      var content = try String(contentsOf: url3!, encoding: .utf8)
                      if(content.contains("url") == false){
                          return
                      }
                     
                      print("Result is",res[0].url)
                      companyurl = res[0].url
                      if let url1 = URL(string: companyurl) {
                         URLSession.shared.dataTask(with: url1) { data1, response1, error1 in
                            if let data1 = data1 {
                                do {
                                   let res1 = try JSONDecoder().decode(CompanyData.self, from: data1)
                                    print("Result Company Data is",res1)
                                    print("Company is",res1.company)
                                    self.company.text = "Company" + (res1.company ?? "")

                                    print("Blog are",res1.blog)
                                    self.Blog.text = "Blog :"  + (res1.blog ?? "")

                                   // companyurl = res[0].url
                                    
                                    
                                }
                                catch let error1 {
                                   print("Error is",error1)
                                }
                             }
                         }.resume()
                      }
                      
                  }
                  catch let error {
                     print("Error is",error)
                  }
               }
           }.resume()
        }
        
   
        
//        guard let myURL = URL(string: "https://api.github.com/users/mojombo/orgs") else {
//                print("Error: \(link) doesn't seem to be a valid URL")
//                return
//            }
//
            do {
                var content = try String(contentsOf: url3!, encoding: .utf8)
                print("Content: \(content.contains("url"))")
            }
        catch let error {
                print("Error: \(error)")
            }
        
        
        
        let data3 = try? Data(contentsOf: url3!)
        //+ String(mygitdata?.)
      //  following.text = String(data2?.count)
        //followers.text = mygitdata?.followingURL
        let url = URL(string: mygitdata!.avatarURL)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //self.notes.image = UIImage(data: data!)
        profileimage.image=UIImage(data: data!)

        let appdelegate=UIApplication.shared.delegate as! AppDelegate

        let context = appdelegate.persistentContainer.viewContext

        
        let request=NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.returnsObjectsAsFaults = false
        do {
            
            let result = try context.fetch(request)
           // print(result)
            var dat1:String?
            for data in result as! [NSManagedObject]{
                if ((data.value(forKey: "id") ) != nil){
                dat1 = (data.value(forKey: "id") as! String)
                }
                else{
                    dat1 = ""
                }
            if( dat1 == String(myindex))
                {
                mytxtview.text = data.value(forKey: "note") as! String
            }
            }
            
        }
        catch{
            print("error2")

            
        }
        
        
    }
    
    
    func getcontent(MyUrl:String)->String{
        let url1 = URL(string: MyUrl)
        var data1 = try? Data(contentsOf: url1!)
        if(data1?.count == nil){
            data1?.count = 0
        }
        return String((data1?.count)!)
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func save(_ sender: Any) {
        
          let appdelegate=UIApplication.shared.delegate as! AppDelegate
          let context = appdelegate.persistentContainer.viewContext
          let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
          let newuser = NSManagedObject(entity: entity!, insertInto: context)
          newuser.setValue(String(myindex), forKey: "id")
        newuser.setValue(mytxtview.text!, forKey: "note")
          //newuser.setValue("34", forKey: "age")

          do {
              
              try context.save()
          }
          catch{
              
              print("error")
          }
          
        let request=NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.returnsObjectsAsFaults = false
        do {
            
            let result = try context.fetch(request)
            print(result)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "note") as! String)
                
            }
            
        }
        catch{
            print("error2")

            
        }
    }
    
}














extension UIView {

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }


       
       @IBInspectable
       var borderWidth: CGFloat {
           get {
               return layer.borderWidth
           }
           set {
               layer.borderWidth = newValue
           }
       }
       
       @IBInspectable
       var borderColor: UIColor? {
           get {
               let color = UIColor.init(cgColor: layer.borderColor!)
               return color
           }
           set {
               layer.borderColor = newValue?.cgColor
           }
       }

    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
               shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
               shadowOpacity: Float = 0.4,
               shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
