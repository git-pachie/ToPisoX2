//
//  URLHelper.swift
//  ToPisoX
//
//  Created by LinuxPlus on 8/27/18.
//  Copyright © 2018 private. All rights reserved.
//

import Foundation
import UIKit

func GetABC(completion: @escaping([CustomerModel]) ->())
{
    let _model = [CustomerModel]()
    
    
    
    completion(_model)
}

func GetClientListFromURL(completed: @escaping([CustomerModel]) ->())
{
    var _model = [CustomerModel]()
    
    let URLX = "http://192.168.8.100/lateloaderdev/home/TestAPI"
    
    //let url = NSURL(fileURLWithPath: "")
    
    let url = NSURL(string: URLX)
    
    URLSession.shared.dataTask(with: (url! as URL), completionHandler: {(data, response, error) -> Void in
        
        if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
            
            //printing the json in console
            print(jsonObj!.value(forKey: "customer")!)
            
            //getting the avengers tag array from json and converting it to NSArray
            if let customerArray = jsonObj!.value(forKey: "customer") as? NSArray
            
            {
                //looping through all the elements
                for cus in customerArray{
                    
                    //converting the element to a dictionary
                    if let customerDict = cus as? NSDictionary {
                        
                        //getting the name from the dictionary
                        if customerDict.value(forKey: "CustomerCode") != nil {
                            
                            print(customerDict)
                            
                            let c = CustomerModel(customerCode: customerDict.value(forKey: "CustomerCode") as! String,
                                                  name: customerDict.value(forKey: "Name") as! String,
                                                  email: "archieangeles@gmail.com", address: "333434343", imageProfileName: "Profile1" )
                            
                           
                            
                            
                            
                             _model.append(c)
                        
                            
                            //adding the name to the array
                            //self.nameArray.append((name as? String)!)
                        }
                        
                    }
                }
            }
            
            OperationQueue.main.addOperation({
                //calling another function after fetching the json
                //it will show the names to label
                //self.showNames()
                //xtable.reloadData()
                
            })
            
            completed(_model)
        }
        
       // model = _model
    
    }).resume()
    
    
    
    //return _model
    
}
