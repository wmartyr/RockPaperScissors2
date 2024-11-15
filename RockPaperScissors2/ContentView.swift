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
                    .font(.title)
                    .fontWeight(.semibold)
                Text(appChoice)
                    .font(.system(size: 200))
                Text("To get a point, you must")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("\(winCondition ? "Win" : "Lose")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Text("Make a selection")
                    .font(.title3)
                    .fontWeight(.semibold)
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
            Text("Your current score is \(score)")
        }
        .alert(alertTitle, isPresented: $showingFinalScore) {
            Button("Play Again", action: newGame)
        }message: {
            Text("Your final score is \(score) out of 10")
        }
    }
    
    func playerSelection(appChoice: String, playerChoice: String) {
        let playerWins = winState.contains(appChoice + playerChoice)
        let playerLoses = loseState.contains(appChoice + playerChoice)
        
        if (winCondition && playerWins) || (!winCondition && playerLoses) {
            score += 1
            alertTitle = "Correct"
        } else {
            alertTitle = "Wrong"
        }
        
        questionsAsked += 1
        
        if questionsAsked < 10 {
            showingScore = true
        } else {
            alertTitle = "Game Over"
            showingFinalScore = true
        }
    }
    
    func newQuestion() {
        appChoice = ["✊", "✋", "✌️"].randomElement() ?? ""
        winCondition = Bool.random()
    }
    
    func newGame() {
        newQuestion()
        score = 0
        questionsAsked = 0
    }
    
// TODO Check why score is 0 on final message.
    
}

#Preview {
    ContentView()
}
