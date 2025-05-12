//
//  AppThemeManager.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

class AppThemeManager: ObservableObject {
    @AppStorage("selectedHouse") private var savedHouse: String = ""
    @Published var selectedHouse: House? {
        didSet {
            if let house = selectedHouse{
                savedHouse = house.rawValue
            }
            else{
                savedHouse = ""
            }
        }
    }
    
    init(){
        if let house = House(rawValue: savedHouse){
            selectedHouse = house
        }
    }
    
    var primaryColor: Color{
        selectedHouse?.color ?? Color("NeutralBackground")
    }
    
    var secondaryColor: Color{
        selectedHouse?.secondaryColor ?? Color("NeutralAccent")
    }
}
