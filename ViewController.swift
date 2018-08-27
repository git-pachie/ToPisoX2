//
//  ViewController.swift
//  ToPisoX
//
//  Created by LinuxPlus on 8/26/18.
//  Copyright © 2018 private. All rights reserved.
//

import UIKit

struct CustomerModel {
    var customerCode: String
    var name: String
    var email: String
    var address: String
    var imageProfileName: String
    
}

class ViewController: UIViewController
{
   

    @IBOutlet weak var myTableView: UITableView!
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
//    {
//        return _cellArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//
//        let lbl = cell.viewWithTag(1) as! UILabel?
//
//
//        lbl?.text = _cellArray[indexPath.row]
//
//
//        return cell
//    }
    

    let _cellArray = ["One","Two","Three","Four","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five","Five"]
    
    
    var _customerArray = [CustomerModel]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let xyz = [CustomerModel].self
        
        GetClientListFromURL { (modelx) in
            self._customerArray = modelx
            
            DispatchQueue.main.async
            {
                self.myTableView.reloadData()
                
            }
            
        }
        
        self.myTableView.addSubview(self.refreshControl)
        
        //
//        self.myTableView.register(UINib(nibName: "PersonCellCollectionViewCell", bundle: nil), forCellReuseIdentifier: "customcell1")
        
//        let nibName = UINib(nibName: "MyTableViewCell", bundle: nil)
//        myTableView.register(nibName, forCellReuseIdentifier: "MyTableViewCell")

       //var ls = GetClientListFromURL()
        
        //_customerArray = GetClientListFromURL()
        
//        _customerArray.append(CustomerModel(customerCode: "10001", name: "Archie Angeles", email: "archieangeles@gmail.com", address: "320 Poblacion, San Isidro, Nueva Ecija", imageProfileName: "Profile1.jgp"))
//        
//        _customerArray.append(CustomerModel(customerCode: "10002", name: "Alexander Angeles", email: "archieangeles@gmail.com", address: "320 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile1"))
//        _customerArray.append(CustomerModel(customerCode: "10004", name: "Anabelle Oligario", email: "Oligario@gmail.com", address: "379 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile2"))
//        _customerArray.append(CustomerModel(customerCode: "10003", name: "Ryan Robles", email: "ryanrobles@gmail.com", address: "456 Mactan, San Isidro, Cebu City", imageProfileName: "Profile3"))
//        _customerArray.append(CustomerModel(customerCode: "10007", name: "Wilmer Angeles", email: "archieangeles@gmail.com", address: "852 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile1"))
//        _customerArray.append(CustomerModel(customerCode: "10008", name: "Jay Angeles", email: "archieangeles@gmail.com", address: "741 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile4"))
//        _customerArray.append(CustomerModel(customerCode: "10009", name: "Claudience Angeles", email: "archieangeles@gmail.com", address: "784 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile2"))
//        _customerArray.append(CustomerModel(customerCode: "10010", name: "Barnaby Sim", email: "archieangeles@gmail.com", address: "156 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile3"))
//        _customerArray.append(CustomerModel(customerCode: "10011", name: "Dai Der Lim", email: "archieangeles@gmail.com", address: "314 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile2"))
//        _customerArray.append(CustomerModel(customerCode: "10012", name: "Khine Su", email: "archieangeles@gmail.com", address: "456 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile3"))
//        _customerArray.append(CustomerModel(customerCode: "10013", name: "Anand Vivec", email: "archieangeles@gmail.com", address: "852 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile5"))
//        _customerArray.append(CustomerModel(customerCode: "10014", name: "Eddie Murphy", email: "archieangeles@gmail.com", address: "874 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile2"))
//        _customerArray.append(CustomerModel(customerCode: "10015", name: "Veronica Gatchalian", email: "archieangeles@gmail.com", address: "897 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile6"))
//        _customerArray.append(CustomerModel(customerCode: "10016", name: "Donato Angeles", email: "archieangeles@gmail.com", address: "541 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile2"))
//        _customerArray.append(CustomerModel(customerCode: "10001", name: "Baby Bundalian", email: "archieangeles@gmail.com", address: "320 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile1"))
//        _customerArray.append(CustomerModel(customerCode: "10001", name: "Marlon Duque", email: "archieangeles@gmail.com", address: "320 Poblacion, Malapit San Isidro, Nueva Ecija", imageProfileName: "Profile3"))

        
        
        myTableView.register(UINib(nibName: "KamoteTableViewCell", bundle: nil), forCellReuseIdentifier: "kamotecell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleRresh(_ refreshControl: UIRefreshControl) {
        
        GetClientListFromURL { (modelx) in
            self._customerArray = modelx
            
            DispatchQueue.main.async
                {
                    self.myTableView.reloadData()
                    refreshControl.endRefreshing()
            }
            
        }
        
        //self.myTableView.reloadData()
        
    }
    
    var refreshControl: UIRefreshControl {
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(handleRresh(_:)), for: UIControlEvents.valueChanged)
        
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
        
        
    }
    
    

}

extension ViewController : UITableViewDelegate
{
    
}


extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _customerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "kamotecell", for: indexPath) as! KamoteTableViewCell
        
        cell._customerCode = _customerArray[indexPath.row].customerCode
        cell.lblName.text = _customerArray[indexPath.row].name
        cell.lblEmail.text = _customerArray[indexPath.row].email
        cell.lblAddress.text = _customerArray[indexPath.row].address
        cell.imageProfile.image = UIImage(named: _customerArray[indexPath.row].imageProfileName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122.0
    }
    
    
}




