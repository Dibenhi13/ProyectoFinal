//
//  BookDetailView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI

struct BookDetailView: View {
    let book: Books
    
    var body: some View {
        ScrollView {
                   VStack(spacing: 20) {
                       if let imageUrl = book.image, let url = URL(string: imageUrl) {
                           AsyncImage(url: url) { image in
                               image
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                           } placeholder: {
                               Color.gray
                           }
                           .frame(height: 250)
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                       }
                       Text(book.title)
                           .font(.title)
                           .fontWeight(.bold)
                           .multilineTextAlignment(.center)
                       if let desc = book.description, !desc.isEmpty {
                           Text(desc)
                               .font(.body)
                               .foregroundColor(.secondary)
                               .padding()
                       } else {
                           Text("Sin descripción disponible.")
                               .italic()
                               .foregroundColor(.gray)
                       }
                   }
                   .padding()
               }
               .navigationTitle(book.title)
               .navigationBarTitleDisplayMode(.inline)
           }
        }

#Preview {
    BookDetailView()
}
