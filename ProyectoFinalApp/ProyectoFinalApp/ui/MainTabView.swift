//
//  MainTabView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var themeManager: AppThemeManager
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            /*CharacterView()
                .tabItem{
                    Label("Characters", systemImage: "person.3.fill")
                }
            SpellsView()
                .tabItem{
                    Label("Spells", systemImage: "wand.fill")
                }
            BooksView()
                .tabItem{
                    Label("Books", systemImage: "book.fill")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.crop.circle")
                }*/
        }
        .accentColor(themeManager.primaryColor)
    }
}

#Preview {
    MainTabView()
}
