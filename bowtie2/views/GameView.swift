//
//  GameView.swift
//  bowtie2
//
//  Created by Jake Runzer on 2020-11-21.
//

import SwiftUI

struct GameView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var game: Game
    
    var body: some View {
        ScrollView {
            ForEach(game.scoresArray, id: \.self) { score in
                PlayerScoreCard(name: score.player!.wrappedName, colour: score.player!.wrappedColor, score: score.currentScore, numTurns: score.history!.count)
            }
        }
        .padding(.all)
        .navigationBarTitle(game.wrappedName, displayMode: .large)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GameView(game: PersistenceController.sampleGame)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
