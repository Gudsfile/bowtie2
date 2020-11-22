//
//  GamesView.swift
//  bowtie2
//
//  Created by Jake Runzer on 2020-11-15.
//

import SwiftUI

struct GamesListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Game.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Game.created, ascending: false)],
        animation: .default)
    private var games: FetchedResults<Game>
    
    @State var isCreating = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(games, id: \.self) { game in
                        NavigationLink(destination: GameView(game: game)) {
                            GameCard(name: game.wrappedName, winner: game.winner?.wrappedName ?? "N", colour: game.winner?.wrappedColor ?? "000000", created: game.wrappedCreated)
                        }
                        .contextMenu {
                            Button(action: {
                                self.deleteGame(game: game)
                            }) {
                                HStack {
                                    Text("Delete Game")
                                    Image(systemName: "trash")
                                }
                            }
                        }
                        
                    }
                }
            }
            .padding(.all)
            .navigationBarTitle("Games", displayMode: .large)
            .toolbar {
                Button(action: {
                    self.isCreating = true
                }) {
                    Label("Create Game", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isCreating) {
                CreateGame()
            }
            
            //            ScrollView {
            //                ForEach(games, id: \.self) { game in
            //                    HStack {
            //                        NavigationLink(destination: GameView(game: game)) {
            //                            GameCard(name: game.wrappedName, winner: game.winner?.wrappedName ?? "N", colour: game.winner?.wrappedColor ?? "000000", created: game.wrappedCreated)
            //                        }
            //                    }
            //                }
            //                .padding(35)
            //            }
            //            .padding(-20)
            //            .navigationTitle("Games")
            //            .toolbar {
            //                Button(action: {
            //                    self.isCreating = true
            //                }) {
            //                    Label("Create Game", systemImage: "plus")
            //                }
            //            }
            //            .sheet(isPresented: $isCreating) {
            //                CreateGame()
            //            }
        }
    }
    
    private func deleteGame(game: Game) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
            viewContext.delete(game)
            
            try! viewContext.save()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
