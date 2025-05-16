//
//  BookDetailView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import Foundation
import SwiftUI

struct BookDetailView: View {
    let book: Books
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: book.cover ?? "Image didnt load")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Text(book.title ?? "Unknown")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text(book.summary ?? "Unknown")
                .font(.body)
                .padding()
                .foregroundColor(.secondary)
        }.padding()
        .navigationTitle(book.title ?? "Unknown")
        .navigationBarTitleDisplayMode(.inline)
    }
}

