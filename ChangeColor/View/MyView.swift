//
//  MyView.swift
//  ChangeColor
//
//  Created by Ольга on 26.07.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import SwiftUI

struct MyView: View {
    
    var nameColor: String
    var accentColor: Color
    @Binding var sliderValue: Double
    
    var body: some View {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        
        return
            HStack {
                Text(nameColor)
                    .foregroundColor(.white)
                    .frame(width: 50, alignment: .center)
                
                Text("\(lround(sliderValue))")
                    .foregroundColor(.white)
                    .frame(width: 50, alignment: .center)
                
                
                Slider(value: Binding(
                    get: {
                        self.sliderValue
                },
                    set: { (newValue) in
                        self.sliderValue = newValue
                }), in: 0...255, step: 1)
                    .accentColor(accentColor).frame(alignment: .center)
        
                TextField("", value: $sliderValue, formatter: formatter) {
                    let value = self.sliderValue
                    switch value {
                    case ..<0:
                        self.sliderValue = 0
                    case 0...255:
                        self.sliderValue = value
                    default:
                        self.sliderValue = 255
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50, alignment: .center)
            }
            .frame(width: UIScreen.main.bounds.width - 20)
            .padding()
    }
}
