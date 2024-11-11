//
//  ContentView.swift
//  RockPaperScissors2
//
//  Created by Woodrow Martyr on 8/11/2024.
//

import SwiftUI

struct ContentView: View {
    let choices = ["✊", "✋", "✌️"]
    let winState = ["✊✋", "✋✌️", "✌️✊"]
    let loseState = ["✊✌️", "✋✊", "✌️✋"]
    
    @State private var appChoice = ["✊", "✋", "✌️"].randomElement() ?? ""
    @State private var winCondition = Bool.random()
    @State private var playerChoice = ""
    @State private var score = 0
    @State private var questionsAsked = 0
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("App Selects")
                Text(appChoice)
                    .font(.system(size: 200))
                Text("To get a point, you must \(winCondition ? "Win" : "Lose")")
                Spacer()
                Text("Make a selection")
                HStack {
                    ForEach(choices, id: \.self) { choice in
                        Button{
                            playerSelection(appChoice: appChoice, playerChoice: choice)
                        }label: {
                            Text(choice)
                                .font(.system(size: 100))
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.linearGradient(colors: [.blue, .mint], startPoint: .top, endPoint: .bottom))
        .alert(alertTitle, isPresented: $showingScore) {
            Button("Continue", action: newQuestion)
        }message: {
            Text(alertMessage)
        }
    }
    
    func playerSelection(appChoice: String, playerChoice: String) {
        let playerWins = winState.contains(appChoice + playerChoice)
        let playerLoses = loseState.contains(appChoice + playerChoice)
        
        if (winCondition && playerWins) || (!winCondition && playerLoses) {
            score += 1
            setAlert(title: "Correct")
        } else {
            setAlert(title: "Wrong")
        }
        
        questionsAsked += 1
        showingScore = true
    }
    
    func setAlert(title: String) {
        alertTitle = title
        alertMessage = "Your current score is \(score)"
    }
    
    func newQuestion() {
        appChoice = ["✊", "✋", "✌️"].randomElement() ?? ""
        winCondition = Bool.random()
    }
}

#Preview {
    ContentView()
}
