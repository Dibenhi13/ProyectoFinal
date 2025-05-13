//
//  books_harry.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//
import SwiftUI
import Foundation

struct Books: Identifiable, Codable {
    let id: String
    let title: String
    let originalTitle: String
    let releaseDate: String
    let description: String
    let pages: Int
    let cover: String
}

