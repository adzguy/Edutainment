//
//  MultiplicationView.swift
//  Edutainment
//
//  Created by Davron on 12/14/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

class Multiplications: ObservableObject {
    @Published var questionAmount = ""
}

struct MultiplicationView: View {
    
    @State private var typedNumber = ""
    @State private var correctAnswer = ""
    @State private var score = 0
    @State private var isShowingScore = false
    @State private var currentQuestion = 1
    @State private var goBackActive = false
    
    let tables = [1,2,3,4,5,6,7,8,9,10,11,12]
    @State private var randomInt = Int.random(in: 1..<13)
    @State private var selectedTable = 5
    @State private var questionAmount = 1
    let questionsAsked = ["5","10","20","All"]
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    
                VStack {
                    VStack {
                        Text("\(tables[selectedTable]) X \(randomInt)")
                            .scaledFont(name: "Chalkduster", size: 50)
                        
                        Text(" = ")
                            .scaledFont(name: "Chalkduster", size: 50)

                        TextField("", text: $typedNumber )
                            .frame(width: 200, height: 50)
                            .border(Color.gray, width: 1)
                            .multilineTextAlignment(.center)
                            .scaledFont(name: "Chalkduster", size: 50)
                    }
                    .padding()
                        
                    VStack {
                        HStack(spacing: 15) {
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
                        .padding(.bottom, 15)
                        
                        HStack(spacing: 15) {
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
                        .padding(.bottom, 15)
                        
                        HStack(spacing: 15) {
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
                        .padding(.bottom, 15)
                        
                        HStack(spacing: 15) {
                            
                            Button(action: {
                                self.clearTapped()
                            })
                            {
                                Text("Clear")
                                    .fontWeight(.heavy)
                                    .buttonStyle()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9258882705, green: 0.8120184075, blue: 0, alpha: 1)))
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
                    }
                    
                    VStack {
                        Text("Q:  \(currentQuestion)/\(questionsAsked[questionAmount])")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                            .padding(.top, 50)
                        
                    }
                    Spacer()
                }

            }.navigationBarItems(leading: Button(action: {
                self.goBackActive = true
            })
            {
                Text("Back")
            })
            .alert(isPresented: $isShowingScore) {
                    Alert(title: Text("Score: \(score)/\(questionsAsked[questionAmount])"), message: Text("Keep it up!"), dismissButton: .default(Text("Start Over"), action: askQuestion))
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
        randomInt = Int.random(in: 1..<13)
        
        if Int(questionsAsked[questionAmount]) == currentQuestion {
            isShowingScore = true
        }
        
    }
    func askQuestion() {
        isShowingScore = false
        currentQuestion = 1
        
    }
}

//Custom Modifier
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(width: 75, height: 75)
            .background(Color.white)
        .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 10, y: 10)
            .scaleEffect(1)
        
    }
}
extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonModifier())
    }
}


struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
