//
//  ContentView.swift
//  Edutainment
//
//  Created by Davron on 12/13/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var active = false
    @State private var selectedTable = 0
    @State public var questionAmount  = 0
    let tables = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let questionsAsked = ["5", "10", "20", "ALL"]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topTrailing, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(alignment: .center, spacing: 10) {
                        Text("Pick multiplication table to practice!")
                            .scaledFont(name: "Chalkduster", size: 18)
                            .foregroundColor(.white)
                        
                        Picker(selection: $selectedTable, label: Text("pick")) {
                            ForEach(0..<tables.count) {
                                Text("\(self.tables[$0])")
                                .scaledFont(name: "Herculanum", size: 14)
                            }

                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 10)

                    }
                    .padding(.top, 60)
                    .padding(.bottom, 60)
                    VStack(spacing: 10){
                        Text("How many questions you want to be asked?")
                            .scaledFont(name: "Chalkduster", size: 20)
                            .foregroundColor(.white)
                            .padding(5)
                        Picker(selection: $questionAmount, label: Text("pick")) {
                            ForEach(0..<questionsAsked.count) {
                                Text("\(self.questionsAsked[$0])")
                                .scaledFont(name: "Herculanum", size: 18)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 10)


                    }
                    .padding(.bottom, 80)
                    
                    Button(action: {
                        self.active.toggle()
                    })
                    {
                        NavigationLink(destination: MultiplicationView()) {
                            Text("Go")
                                .frame(width: 100, height: 50)
                                .foregroundColor(.green)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: CGFloat(10.0)))
                        }
                        
                    }
                    .animation(.default)
                    Spacer()
   
                }.navigationBarTitle("Edutainment")
            }
        }
    }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
