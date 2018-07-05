

import UIKit
import Alamofire

class CurrentWeather  {
    var cityName:String!
    var date:String!
    var weatherType:String!
    var currrnttemp=""
    
    func downloadWeatherDetails(completed:@escaping DownLoadCompleted){
        let url=URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(url).responseJSON { (resault) in
            let res=resault.result
            if let dict=res.value as? [String:Any]{
                //print(dict)
                if let name=dict["name"] as? String{self.cityName=name.capitalized
                    print("&^%$%^&*")
                    print(self.cityName)


}
                if let weather=dict["weather"] as? [[String:Any]]{
                    if let main=weather[0]["main"] as? String{
                        self.weatherType=main
                        print(self.weatherType)
                    }
                }
                if let main=dict["main"] as? [String:Any]{
                    if let temp=main["temp"] as? Double{
                        self.currrnttemp="\(Int(temp)-273)"
                        print(self.currrnttemp)

                    }
                }

            }
            completed()

        }
        
        
    }
    
    
    }
