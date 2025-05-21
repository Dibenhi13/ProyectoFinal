//
//  books_harry.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//
import SwiftUI
import Foundation

struct Books: Identifiable, Codable {
    var id: String? { serial }
    let serial: String?
    let title: String?
    let summary: String?
        let release_date: String?
        let dedication: String?
        let pages: String?
        let cover: String?
        let wiki: String?
}

