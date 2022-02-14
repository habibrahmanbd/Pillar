//
//  AdhanSelectionView.swift
//  Pillar
//
//  Created by Habibur Rahman on 2022-02-12.
//

import SwiftUI

struct AdhanSelectionView: View{
    let title: String
    
    var body: some View{
        Text(title).font(.largeTitle)
    }
}
struct AdhanSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AdhanSelectionView(title: "Hello")
    }
}
