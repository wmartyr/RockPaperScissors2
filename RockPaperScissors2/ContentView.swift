//
//  ContentView.swift
//  RockPaperScissors2
//
//  Created by Woodrow Martyr on 8/11/2024.
//

import SwiftUI

struct ContentView: View {
    let choices = ["✊", "✋", "✌️"]
    @State private var appChoice = ["✊", "✋", "✌️"].randomElement() ?? ""
    @State private var winCondition = Bool.random()
    @State private var playerChoice = ""
    
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
        .background(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
    }
    
}

#Preview {
    ContentView()
}
