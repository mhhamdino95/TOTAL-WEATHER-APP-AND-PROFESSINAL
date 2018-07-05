//
//  ViewController.swift
//  rainyShinnyApply
//
//  Created by A One Way To Allah on 7/3/18.
//  Copyright © 2018 A One Way To Allah. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var currentImgImg: UIImageView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    var lm=CLLocationManager()
    var cc:CLLocation!
    var cw:CurrentWeather!
    var fr:Forcast!
    var arrForcasts=[Forcast]()
    
    func updatwDataLbl() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        dataLbl.text=currentDate
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
lm.delegate=self
        lm.desiredAccuracy=kCLLocationAccuracyHundredMeters
        lm.requestWhenInUseAuthorization()
      lm.startMonitoringSignificantLocationChanges()
        cw=CurrentWeather()

        updatwDataLbl()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthstatues()
       
        
    }
    
    func locationAuthstatues(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            cc=CLLocation()
            cc=lm.location
            Location.sharedInstance.latitude=cc.coordinate.latitude
            Location.sharedInstance.longitude=cc.coordinate.longitude
            cw.downloadWeatherDetails {
                self.downloadForcastData {
                    self.updateUI()
                    
                }
            }
        }else{
            lm.requestWhenInUseAuthorization()
            locationAuthstatues()
        }
    }
    
    
    func downloadForcastData(completed:@escaping DownLoadCompleted){
        let forcastURl=URL(string:FORCAST_URL)!
        Alamofire.request(forcastURl).responseJSON { (resault) in
            let res=resault.result
            if let dict=res.value as? [String:Any]{
                
                if let list=dict["list"] as? [[String:Any]]{
                    for obj in list{
                        let fCast=Forcast(weatherDict: obj)
                        self.arrForcasts.append(fCast)
                        print(obj)
                    }
                    self.arrForcasts.remove(at: 0)
                    self.table.reloadData()
                    //
                    
                }
            }
            completed()
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    func updateUI(){
        currentTempLbl.text=cw.cityName
        tempLbl.text=cw.currrnttemp
        weatherTypeLbl.text=cw.weatherType
        currentImgImg.image=UIImage(named: cw.weatherType)
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        
        let forc = arrForcasts[indexPath.row]
        cell.configureCell(cellFr: forc)
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrForcasts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

//extension ViewController:CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        let locMg=CLLocationManager()
//        locMg.delegate=self
//        locMg.desiredAccuracy=kCLLocationAccuracyHundredMeters
//        locMg.requestWhenInUseAuthorization()
//        locMg.startUpdatingLocation()
//        //mansoura 31.040948    31.378470
//        //https://www.latlong.net/
//
//
//        let loc=locations[locations.count-1]
//        if loc.horizontalAccuracy>0{
//            locMg.stopUpdatingLocation()
//            lm.delegate=nil
//
//
//            let lat="\(loc.coordinate.latitude)"
//            let lon="\(loc.coordinate.longitude)"
//
//            let params=[
//                "lat":lat,
//                "lon":lon,
//                "appid”:
//            ]
//        }
//
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            print(error)
//            .text="Location Unavailable"
//        }
//
//}
