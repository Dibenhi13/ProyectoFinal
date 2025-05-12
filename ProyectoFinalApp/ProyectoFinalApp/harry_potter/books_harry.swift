//
//  books_harry.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//
import SwiftUI

struct Books: Identifiable, Codable {
    let index: Int
    let title: String
    let originalTitle: Bool
    let releaseDate: String
    let description: String
    let pages: Int
    let cover: String
}

