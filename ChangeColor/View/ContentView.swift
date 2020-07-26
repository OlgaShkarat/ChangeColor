//
//  ContentView.swift
//  ChangeColor
//
//  Created by Ольга on 23.07.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var red: Double = 218
    @State var green: Double = 121
    @State var blue: Double = 87
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                RectangleView(red: red/255, green: green/255, blue: blue/255)
                MyView(nameColor: "Red", accentColor: .red, sliderValue: $red)
                MyView(nameColor: "Green", accentColor: .green, sliderValue: $green)
                MyView(nameColor: "Blue", accentColor: .blue, sliderValue: $blue)
                Spacer()
            }.padding()
        }
    }
}

struct RectangleView: View {
    
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        Color(red: red, green: green, blue: blue)
            .frame(width: 300, height: 100)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
