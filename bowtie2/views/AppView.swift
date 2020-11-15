//
//  AppView.swift
//  bowtie2
//
//  Created by Jake Runzer on 2020-11-15.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            GamesView().tabItem {
                Image(systemName: "house.fill")
                Text("Games")
            }
            PlayersView().tabItem {
                Image(systemName: "person.2.fill")
                Text("Players")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}