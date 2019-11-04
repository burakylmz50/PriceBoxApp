//
//  DuyurularController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 3.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class DuyurularController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var a = DuyurularView()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        a.duyuruText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DuyurularTableViewCell
        cell.duyuruMetin.text = a.duyuruText[indexPath.row].duyuru
        cell.tarihMetin.text = a.duyuruText[indexPath.row].tarih
        
        return cell
    }
    
    @IBAction func backButton(_ sender: Any) {
                 self.performSegue(withIdentifier: "duyurularToHome", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        a.duyurulariGetir()
        tableView.separatorColor = UIColor.white
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    //NoficationCenter ve bu fonksiyonu -> reload datayı view içinde çağıramadığımız için kullandım.
    @objc func loadList(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}

