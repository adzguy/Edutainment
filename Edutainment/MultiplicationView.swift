//
//  MultiplicationView.swift
//  Edutainment
//
//  Created by Davron on 12/14/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct Questions {
    let questions = ["1 x 1", "1 x 2", "1*3", "1*4", "1*5", "1*6", "1*7", "1*8", "1*9", "1*10", "1*11", "1*12",
        "2*1", "2*2", "2*3", "2*4", "2*5", "2*6", "2*7", "2*8", "2*9", "2*10", "2*11", "2*12",
        "3*1", "3*2", "3*3", "3*4", "3*5", "3*6", "3*7", "3*8", "3*9", "3*10", "3*11", "3*12",
    ]
}

//Custom Modifier
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(width: 75, height: 75)
        .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
        .clipShape(Circle())
        
    }
}
extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonModifier())
    }
}

struct MultiplicationView: View {
    
    @State private var typedNumber = ""
    @State private var correctAnswer = 0
    @State private var score = 0
    @State private var isShowingScore = false
    @State private var currentQuestion = 1
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {

                VStack {
                    
                    Text("DisplayQuestion")
                        .padding()
                    Text(" = ")
                        .font(.largeTitle)

                    TextField("", text: $typedNumber )
                        .frame(width: 200, height: 50)
                        .border(Color.gray, width: 1)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                }
                .padding()
                
                HStack(spacing: 20) {
                    createDigit("1")
                        .buttonStyle()
                        .font(.largeTitle)
                    createDigit("2")
                        .buttonStyle()
                        .font(.largeTitle)
                    createDigit("3")
                        .buttonStyle()
                        .font(.largeTitle)
                }
                .padding()
                
                HStack(spacing: 20) {
                    createDigit("4")
                        .buttonStyle()
                        .font(.largeTitle)
                    createDigit("5")
                        .buttonStyle()
                        .font(.largeTitle)
                    createDigit("6")
                        .buttonStyle()
                        .font(.largeTitle)
                }
                .padding()
                
                HStack(spacing: 20) {
                    createDigit("7")
                        .buttonStyle()
                        .font(.largeTitle)
                    createDigit("8")
                        .buttonStyle()
                        .font(.largeTitle)
                    createDigit("9")
                        .buttonStyle()
                        .font(.largeTitle)
                }
                .padding()
                
                HStack(spacing: 20) {
                    
                    Button(action: {
                        self.clearTapped()
                    })
                    {
                        Text("Clear")
                            .fontWeight(.heavy)
                            .buttonStyle()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9447464347, blue: 0, alpha: 1)))
                    }
                    
                    createDigit("0")
                        .buttonStyle()
                        .font(.largeTitle)
                    
                    Button(action: {
                        self.enterTapped()
                    })
                    {
                        Text("Enter")
                            .fontWeight(.heavy)
                            .buttonStyle()
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)))
                    }
                }
                Text("Q:  \(currentQuestion)/\(ContentView().questionAmount)")
                    .foregroundColor(.orange)
                    .font(.largeTitle)
                    .padding(.top, 50)
            }
        }
    }
    func createDigit(_ number: String) -> Button<Text>{
        Button(action: {
            self.digitTapped(number)
        })
        {
            Text(number)
        }
    }
    
    func digitTapped(_ num: String) {
        typedNumber += num
    }
    
    func clearTapped() {
        typedNumber = ""
    }
    
    func enterTapped() {
        if typedNumber == String(correctAnswer) {
            score += 1
        }
        currentQuestion += 1
        typedNumber = ""
    }
}


struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
