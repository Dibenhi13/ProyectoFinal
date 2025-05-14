//
//  ProyectoFinalAppApp.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/9/25.
//

import SwiftUI

@main
struct PotterApp: App {
    @StateObject var themeManager = AppThemeManager()
    @StateObject var controlador = ControladorApp()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(themeManager)
                .environmentObject(controlador)
        }
    }
}


