//
//  ViewController.swift
//  Json_Data_UITablleView_Country&Capital_Swift4
//
//  Created by DeEp KapaDia on 27/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit


struct Countries : Decodable {
    var name:String
    var capital:String
    var region:String
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    
    var country = [Countries]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONdata {
            self.tableview.reloadData()
        }
        
        tableview.delegate = self
        tableview.dataSource = self
       
        //self.tableview.separatorStyle = UITableViewCellStyle.default
       
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DisplayCell
     
        cell.Namelbl.text = country[indexPath.row].name.capitalized
        cell.CapitalLbl.text = country[indexPath.row].capital
        cell.RegionLbl.text = country[indexPath.row].region
        cell.layer.cornerRadius = 25
        
        return cell
    }
    
    func JSONdata(completed:@escaping () -> ()){
        
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil{
                do{
                    
                    self.country = try JSONDecoder().decode([Countries].self, from: data!)
                    
                    DispatchQueue.main.async {
                        
                      completed()
                        
                    }
                    
                }catch{
                    
                    print("error")
                    
                }
            }
            
            }.resume()
        
    }
    
    
}

