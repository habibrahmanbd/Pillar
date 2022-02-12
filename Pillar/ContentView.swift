//
//  ContentView.swift
//  Pillar
//
//  Created by Habibur Rahman on 2022-02-10.
//

import SwiftUI

struct ContentView: View {
    //resCode: ResponseCode(code: 200),
    //resStatus: "400",
    @State var prayers = Prayer(results: ResponseResults(datetime: [DateTimeData(times: TimesData(Fajr: "", Imsak:"", Sunrise: "", Dhuhr: "", Asr: "", Maghrib: "", Sunset: "",Isha: "", Midnight:""), date: DateData(timestamp:0, gregorian:"", hijri:""))], location: LocationData(), settings: SettingsData()))
    let curCity = "Edmonton"
    func getData(){
        let urlString = "https://api.pray.zone/v2/times/today.json?timeformat=1&city="+curCity.lowercased()
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            DispatchQueue.main.async{
                if let data = data{
                    do{
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Prayer.self, from: data)
                        self.prayers = decodedData
                    }catch{
                        print(error)
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        VStack{
            Section {
                let date = String(DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none))
                let time = String(DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short))
                Text(time).font(.system(size: 60))
                Text(date).font(.system(size: 20))
                Text(curCity).font(.system(size: 30))
            }
            Section{
                List{
                    HStack{
                        Text("Fajr").bold().frame(width: 120, height: 20, alignment: .leading)
                        HStack(alignment: .lastTextBaseline){
                            Label("", systemImage: "clock").frame(width: 20, height: 20, alignment: .center)
                            Text(prayers.results.datetime.first?.times.Fajr ?? "NULL").frame(width: 100, height: 20, alignment: .center)
                            Label("", systemImage: "speaker.2")
                        }
                    }
                    HStack{
                        Text("Sunrise").bold().frame(width: 120, height: 20, alignment: .leading)
                        HStack(alignment: .lastTextBaseline){
                            Label("", systemImage: "clock").frame(width: 20, height: 20, alignment: .center)
                            Text(prayers.results.datetime.first?.times.Sunrise ?? "NULL").frame(width: 100, height: 20, alignment: .center)
                            //Label("", systemImage: "speaker.2")
                        }
                    }
                    HStack{
                        Text("Dhuhr").bold().frame(width: 120, height: 20, alignment: .leading)
                        HStack(alignment: .lastTextBaseline){
                            Label("", systemImage: "clock").frame(width: 20, height: 20, alignment: .center)
                            Text(prayers.results.datetime.first?.times.Dhuhr ?? "NULL").frame(width: 100, height: 20, alignment: .center)
                            Label("", systemImage: "speaker.2")
                        }
                    }
                    HStack{
                        Text("Asr").bold().frame(width: 120, height: 20, alignment: .leading)
                        HStack(alignment: .lastTextBaseline){
                            Label("", systemImage: "clock").frame(width: 20, height: 20, alignment: .center)
                            Text(prayers.results.datetime.first?.times.Asr ?? "NULL").frame(width: 100, height: 20, alignment: .center)
                            Label("", systemImage: "speaker.2")
                        }
                    }
                    HStack{
                        Text("Maghrib").bold().frame(width: 120, height: 20, alignment: .leading)
                        HStack(alignment: .lastTextBaseline){
                            Label("", systemImage: "clock").frame(width: 20, height: 20, alignment: .center)
                            Text(prayers.results.datetime.first?.times.Maghrib ?? "NULL").frame(width: 100, height: 20, alignment: .center)
                            Label("", systemImage: "speaker.2")
                        }
                    }
                    HStack{
                        Text("Isha").bold().frame(width: 120, height: 20, alignment: .leading)
                        HStack(alignment: .lastTextBaseline){
                            Label("", systemImage: "clock").frame(width: 20, height: 20, alignment: .center)
                            Text(prayers.results.datetime.first?.times.Isha ?? "NULL").frame(width: 100, height: 20, alignment: .center)
                            Label("", systemImage: "speaker.2")
                        }
                    }
                }
            }
            Section{
                List{
                    Label("Hadith of the Day", systemImage: "quote.bubble.fill")
                    let randomHadithEn = "The deeds are considered by the intentions, and a person will get the reward according to his intention. So whoever emigrated for Allah and His Messenger, his emigration will be for Allah and His Messenger; and whoever emigrated for worldly benefits or for a woman to marry, his emigration would be for what he emigrated for. [Al-Bukhari and Muslim]."
                    let randomHadithAr = "بسم الله الرحمن الرحيم\n1- باب الإخلاص وإحضار النية في جميع الأعمال والأقوال والأحوال البارزة والخفية، قَالَ اللهُ تَعَالَى: {وَمَا أُمِرُوا إِلاَّ لِيَعْبُدُوا اللَّهَ مُخْلِصِينَ لَهُ الدِّينَ حُنَفَاءَ وَيُقِيمُوا الصَّلاةَ وَيُؤْتُوا الزَّكَاةَ وَذَلِكَ دِينُ الْقَيِّمَةِ} [البينة : 5]، وَقالَ تَعَالَى: {لَنْ يَنَالَ اللَّهَ لُحُومُهَا وَلا دِمَاؤُهَا وَلَكِنْ يَنَالُهُ التَّقْوَى مِنْكُمْ} [الحج: 37]، وَقالَ تَعَالَى: {قُلْ إِنْ تُخْفُوا مَا فِي صُدُورِكُمْ أَوْ تُبْدُوهُ يَعْلَمْهُ اللَّهُ} [آل عمران: 29]."
                    Text(randomHadithAr).font(.body)
                    Text(randomHadithEn).font(.body)
                }
            }
        }.onAppear {
            self.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
