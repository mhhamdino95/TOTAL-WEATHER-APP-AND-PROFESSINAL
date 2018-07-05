

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY="b6907d289e10d714a6e88b30761fae22"
typealias DownLoadCompleted = ()->()

let CURRENT_WEATHER_URL2="\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)120\(APP_ID)\(APP_KEY)"

let CURRENT_WEATHER_URL = "https://samples.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=b6907d289e10d714a6e88b30761fae22"

let FORCAST_URL="https://samples.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"


