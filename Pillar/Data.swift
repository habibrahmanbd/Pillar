//
//  Data.swift
//  Pillar
//
//  Created by Habibur Rahman on 2022-02-11.
//

import Foundation
import SwiftUI

struct DefaultsKey{
    static let curCity = "Edmonton, Canada"
}

struct Prayer: Decodable{
    //var resCode: ResponseCode
    //var resStatus: String
    var results: ResponseResults
}

struct ResponseCode: Decodable{
    var code: Int
}

struct ResponseResults: Decodable{
    var datetime: [DateTimeData]
    var location: LocationData
    var settings: SettingsData
}

struct DateTimeData: Decodable{
    var times: TimesData
    var date: DateData
}

struct TimesData: Decodable{
    var Fajr: String
    var Imsak: String
    var Sunrise: String
    var Dhuhr: String
    var Asr: String
    var Maghrib: String
    var Sunset: String
    var Isha: String
    var Midnight: String
}
struct DateData: Decodable{
    var timestamp: Int
    var gregorian: String
    var hijri: String
}

struct LocationData: Decodable{
    
}

struct SettingsData: Decodable{
    
}



// Data from PrayerTime API
/*{
    "code":200,
    "status":"OK",
    "results":
        {"datetime":[
            {
                "times":
                {
                    "Imsak":"06:12",
                    "Sunrise":"07:54",
                    "Fajr":"06:22",
                    "Dhuhr":"12:48",
                    "Asr":"15:07",
                    "Sunset":"17:43",
                    "Maghrib":"18:00",
                    "Isha":"19:15",
                    "Midnight":"00:03"
                },
                "date":{
                        "timestamp":1644537600,
                        "gregorian":"2022-02-11",
                        "hijri":"1443-07-10"
                }
            }
        ],
            "location":{
                "latitude":53.544387817382812,
                "longitude":-113.49092864990234,
                "elevation":626.0,
                "city":"Edmonton",
                "country":"Canada",
                "country_code":"CA",
                "timezone":"America/Edmonton",
                "local_offset":-7.0
            },
            "settings":{
                "timeformat":"HH:mm",
                "school":"Ithna Ashari",
                "juristic":"Shafii",
                "highlat":"None",
                "fajr_angle":15.0,
                "isha_angle":15.0
            }
        }
}
*/

