//
//  PlayerScoreCard.swift
//  bowtie2
//
//  Created by Jake Runzer on 2020-11-21.
//

import SwiftUI

struct PlayerScoreCard: View {
    var name: String
    var colour: String
    var score: Int
    var numTurns: Int
    var maxScoresGame: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(hex: colour)
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("\(score)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text(name)
                        .foregroundColor(.white)
                        .font(.callout)
                }.frame(maxHeight: .infinity)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("\(numTurns)")
                        .font(.caption)
                        .frame(minWidth: 16, minHeight: 16)
                        .padding(.all, 4)
                        .foregroundColor(Color.white)
                        .background(numTurns < maxScoresGame ? Color.red : Color(hex: colour).lighter(by: 30))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(numTurns < maxScoresGame ? 0.2 : 0), radius: 5)
                    
                    Spacer()
                }
            }.padding(.all)
        }
        .frame(height: 120)
        .cornerRadius(24)
//        .shadow(color: Color(hex: colour), radius: 4)
    }
}

struct PlayerScoreCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScoreCard(name: "Jake",
                        colour: "FF00FF",
                        score: 100,
                        numTurns: 1,
                        maxScoresGame: 1)
            .padding(.horizontal)
    }
}
