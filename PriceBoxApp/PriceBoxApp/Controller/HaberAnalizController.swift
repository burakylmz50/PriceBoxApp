//
//  HaberAnalizController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 4.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class HaberAnalizController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    @IBAction func backBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "haberAnalizToHome", sender: self)
    }
    var a = HaberAnalizView()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        a.haberAnalizText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HaberAnalizTableViewCell
        cell.haberKonusuText.text = a.haberAnalizText[indexPath.row].baslik
        return cell
    }
    
    //    Haberlere tıklandığında neler yapacağı?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    @IBOutlet weak var haberAnalizTableView: UITableView!
    
    override func viewDidLoad() {
        let result : Int = (a.haberAnalizText.count) / 4
        a.haberAnalizGetir()
        haberAnalizTableView.separatorColor = UIColor.white
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    //NoficationCenter ve bu fonksiyonu -> reload datayı view içinde çağıramadığımız için kullandım.
    @objc func loadList(){
        DispatchQueue.main.async {
            self.haberAnalizTableView.reloadData()
        }
        
    }
}
