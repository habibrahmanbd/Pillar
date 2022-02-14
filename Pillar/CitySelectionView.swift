//
//  CitySelectionView.swift
//  Pillar
//
//  Created by Habibur Rahman on 2022-02-12.
//

import SwiftUI



struct CitySelectionView: View{
    let title: String
    @State var cityList: [String] = []
    @State private var searchText = ""
    func getCSVData(inputFile:String) {
        do {
            if let fileURL = Bundle.main.url(forResource: inputFile, withExtension: "csv"){
                cityList = ["Here"]
                let content = try String(contentsOf: fileURL)
                cityList = content.components(
                    separatedBy: "\r\n"
                )
                    .map{ $0.components(separatedBy: ",")[0] + ", " + $0.components(separatedBy: ",")[1] }
            } else{
                cityList = ["Null"]
            }
        }
        catch {
            cityList = ["Null"]
        }
    }
    @State var selectedCity: String? = nil
    var body: some View{
        VStack{
            Text(title).font(.title)
            List{
                TextField("Seach", text: $searchText).cornerRadius(10)
                ForEach(cityList, id: \.self){ city in
                    if city.contains(searchText){
                        SelectionCell(cityName: city, selectedCity: self.$selectedCity).searchable(text: $searchText)
                    }
                }
            }.onAppear{
                self.getCSVData(inputFile: "worldcities")
            }
        }
    }
}
struct SelectionCell: View {
    
    let cityName: String
    @Binding var selectedCity: String?
    
    var body: some View {
        HStack {
            Text(cityName).bold()
            Spacer()
            if cityName == selectedCity {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }   .onTapGesture {
            self.selectedCity = self.cityName
            let defaults = UserDefaults.standard
            defaults.set("\(cityName.replacingOccurrences(of: "\r", with: ""))", forKey: DefaultsKey.curCity)
        }
    }
}

struct CitySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectionView(title: "Select City")
    }
}
