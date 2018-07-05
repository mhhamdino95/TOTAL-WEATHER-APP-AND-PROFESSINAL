

import UIKit

struct Forcast{
    var date=""
    var weatherType=""
    var hTemp=""
    var lTemp=""
    
    init(weatherDict:[String:Any]) {
        if let temp=weatherDict["temp"] as? [String:Any]{
            if let min=temp["min"] as? Double{
                self.lTemp="\(Int(min)-273)"
            }
            if let max=temp["max"] as? Double{
                self.hTemp="\(Int(max)-273)"
            }
        }
              if let weather=weatherDict["weather"] as? [[String:Any]]{
                if let main=weather[0]["main"] as? String{
                    self.weatherType=main
                }
        }
                if let date=weatherDict["dt"] as? Double{

                    let unixConvertedDate = Date(timeIntervalSince1970: date)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .full
                    dateFormatter.dateFormat = "EEEE"
                    dateFormatter.timeStyle = .none
                    self.date = unixConvertedDate.dayOfTheWeek()
                    
        }
    }
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
