//
//  ViewController.swift
//  getmydata
//
//  Created by Ammad on 09/07/2022.
//

import UIKit
import CoreData
//var mylist:[]
var mylist:[GithubModelElement]=[]
var mylist1:[GithubModelElement]=[]
var mylist2:[GithubModelElement]=[]

var mygitdata:GithubModelElement?
var myindex = 0

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var mylist3:[GithubModelElement]?
    @IBOutlet weak var mytxtfield: UITextField!
    var count = 1
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("selected row is",indexPath)
        print("My data is",mylist[indexPath.row])
        myindex = indexPath.row

        mygitdata = mylist[indexPath.row]
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVcViewController") as! SecondVcViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
        print("navigation done")
        
    
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var noforows = 5*count
        if(noforows > mylist.count){
            noforows = mylist.count
        }
        
        return noforows
        //mylist.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      /*
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let newuser = NSManagedObject(entity: entity!, insertInto: context)
        newuser.setValue("Nawaz", forKey: "name")
        newuser.setValue("khqn", forKey: "lastname")
        newuser.setValue("34", forKey: "age")

        do {
            
            try context.save()
        }
        catch{
            
            print("error")
        }
        */
        var cell = mytblview.dequeueReusableCell(withIdentifier: "GitProfileXib", for: indexPath) as! GitProfileXib
        //cell.username = "Ammad"
        if(indexPath.row > mylist.count || (mylist.isEmpty == true) ){
       cell.setdataincell("ios", "Bye", "Ammad", "ios")
        }
        else{
            mylist3=mylist
            //mylist1 = mylist
            cell.setdataincell(mylist[indexPath.row].avatarURL,mylist[indexPath.row].type , mylist[indexPath.row].login, "note")
      
        
        }
        
    return cell
    }
    func reload(){
        
        mytblview.reloadData()
    }
    
    @IBAction func Mysearch(_ sender: Any) {
mylist = mylist1
    print("Editing")
        mylist2 = []
        //mylist = mylist1
        print("My list is",mylist)
       
        
        //print("My list is",mylist3)
        
        for ele in mylist{
            print(ele)
            print(ele.login.lowercased())
            print((mytxtfield.text?.lowercased())!)
            if(ele.login.lowercased().contains((mytxtfield.text?.lowercased())!))
            {
                
                mylist2.append(ele)
            }
            
            
        }
        
        print(mylist2.count)
        if(mytxtfield.text == ""){
            
            mylist = mylist1
            reload()
            print("My list 3 good is",mylist.count)

print("Full")
           // reload()
        }
        else if(mylist2.isEmpty == false){
            print("Filtered")

            mylist = mylist2
            print("My list good is",mylist)

            reload()
        }
        
        
    }
    
    @IBAction func searchfield(_ sender: Any) {
    }
    
    @IBOutlet weak var mytblview: UITableView!
    @IBOutlet weak var label2: UILabel!
    var res=Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("yes")
        var loaddata=Upload(label2)
        loaddata.gettodata(loaddata,mytblview)
        mytblview.delegate = self
        mytblview.dataSource = self
       // mytblview.register(GitProfileXib.self, forCellReuseIdentifier: "GitProfileXib")
       // loaddata.printdata()
        mytblview.register(UINib(nibName: "GitProfileXib", bundle: nil), forCellReuseIdentifier: "GitProfileXib")

    
    }
    
    
    
    
    
    

    
    @IBAction func more(_ sender: Any) {
   count = count + 1
        mytblview.reloadData()
    }
    
    
    
    

    
    
    
    
    
    
    
   
    
  

}


