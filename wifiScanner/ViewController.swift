//
//  ViewController.swift
//  wifiScanner
//
//  Created by Krishna Kushwaha on 21/05/21.
//
import MMLanScan
import UIKit

class ViewController: UIViewController,MMLANScannerDelegate, UITableViewDelegate, UITableViewDataSource {


    
    @IBOutlet weak var tableview: UITableView!
    var wifilistArr = [String]()
    var lanScanner : MMLANScanner!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lanScanner = MMLANScanner(delegate:self)
        // Do any additional setup after loading the view.
        self.lanScanner.start()
    }

    
    func lanScanDidFindNewDevice(_ device: MMDevice!) {
        print(device.ipAddress)
        wifilistArr.append(device.ipAddress)
        tableview.reloadData()
    }
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        
    }
    
    func lanScanDidFailedToScan() {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wifilistArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "iP Address:" + wifilistArr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    

}

